class CharactersController < ApplicationController

  def create_user_role
    @user_role = UserRole.create(
      user_id: current_user.id,
      character_id: params[:character_id],
      submitted: false,
      submitted_date: null,
      invited_to_callbacks: false,
      cast_in_show: false
    )

    if @user_role.valid?
      render json: {message: "Success"}
    else
      render json: {errors: @user_role.errors.full_messages}, status: 422
    end
  end

end
