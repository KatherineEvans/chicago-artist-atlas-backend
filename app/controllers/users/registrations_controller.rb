# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionFix
  respond_to :json

  private

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def respond_with(resource, _opts = {})
      if request.method == "POST" && resource.persisted?

        begin
          result = ChargeBee::Customer.create({
              :first_name => resource[:first_name],
              :last_name => resource[:last_name],
              :email => resource[:email],
          })
          customer = result.customer

          begin
            result = ChargeBee::Subscription.create_with_items(customer.id, {
              :subscription_items => [
                {
                  :item_price_id => "General-Artist-Membership-USD-Monthly",
                  :unit_price => 0
                }
              ]
            })
            subscription = result.subscription

            user = User.find(resource.id)

            user.update(
              chargebee_customer_id: customer.id,
              chargebee_subscription_id: subscription.id,
            )

          rescue => e
            Rails.logger.error "An error occurred creating a subscription: #{e.message}"
          end
        rescue => e
          Rails.logger.error "An error occurred creating a customer: #{e.message}"
        end

        UserMailer.with(user: resource).welcome_message.deliver_now

        render json: {
          status: {code: 200, message: "Signed up sucessfully.", url: result.hosted_page.to_s},
        }, status: :ok

      elsif request.method == "DELETE"
        render json: {
          status: { code: 200, message: "Account deleted successfully."}
        }, status: :ok
      else
        render json: {
          status: {code: 422, message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}"}
        }, status: :unprocessable_entity
      end
    end
end