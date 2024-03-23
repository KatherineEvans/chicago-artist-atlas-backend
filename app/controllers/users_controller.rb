class UsersController < ApplicationController
  def show
    render json: current_user, methods: [:trainings, :awards, :performances, :user_roles, :user_talents, :user_tech_talents]
  end

  def update
    user = current_user

    user.update(
      first_name: params[:user][:first_name],
      last_name: params[:user][:last_name]
    )

    if user.valid?
      if user.address_id
        address = Address.find(user.address_id)
        address.update(
          address1: params[:address][:street],
          city: params[:address][:city],
          state: params[:address][:state],
          country: params[:address][:country],
          postal_code: params[:address][:postal_code]
        )
      else
        address = Address.create(
          address1: params[:address][:street],
          city: params[:address][:city],
          state: params[:address][:state],
          country: params[:address][:country],
          postal_code: params[:address][:postal_code]
        )
      end
      if address.valid?
        user.update(address_id: address.id)
        render json: user
      else
        render json: {errors: address.errors.full_messages}, status: 422
      end
    else
      render json: {errors: user.errors.full_messages}, status: 422
    end
  end

  def notify_me
    NotifyMeMailer.with(email: params[:email]).notify_message.deliver_now
  end
end
