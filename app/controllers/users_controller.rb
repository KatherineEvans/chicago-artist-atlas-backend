class UsersController < ApplicationController
  def show
    render json: current_user
  end

  def update
    user = current_user
    user.update(
      first_name: params[:first_name],
      last_name: params[:last_name]
    )

    if user.valid?
      if user.address_id
        address = Address.find(user.address_id)
        address.update(address1: params[:street_address],
          city: params[:city],
          state: params[:region], 
          country: params[:country], 
          postal_code: params[:postal_code]
        )
      else
        address = Address.create(
          address1: params[:street_address],
          city: params[:city],
          state: params[:region], 
          country: params[:country], 
          postal_code: params[:postal_code]
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
end
