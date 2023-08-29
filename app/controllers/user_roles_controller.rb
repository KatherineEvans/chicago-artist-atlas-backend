class UserRolesController < ApplicationController
  def index
    user_roles = current_user.user_roles
    render json: user_roles
  end

  def update
    @user_role = UserRole.find(params[:id])
  #   @user_role.update()
  end

  def create
    @user_role = UserRole.create(
      user_id: current_user.id,
      character_id: params[:character_id],
      submitted: false,
      submitted_date: nil,
      invited_to_callbacks: false,
      cast_in_show: false
    )

    if @user_role.valid?
      render json: @user_role
    else
      render json: {errors: @user_role.errors.full_messages}, status: 422
    end
  end

  def destroy
    @user_role = UserRole.find(params[:id])
  end
end
