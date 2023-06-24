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
        UserMailer.with(user: resource).welcome_message.deliver_now

        render json: {
          status: {code: 200, message: "Signed up sucessfully."},
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