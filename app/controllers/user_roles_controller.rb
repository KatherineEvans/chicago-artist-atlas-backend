class UserRolesController < ApplicationController
  def index
    user_roles = current_user.user_roles

    if params[:type] == "pluck"
      user_roles = user_roles.pluck("character_id")
      render json: user_roles
    else

      user_roles = user_roles.includes(character: :audition)

      saved = []
      submitted = []
      callbacks = []
      cast = []

      user_roles.each do |role|
        r = {role: role, character: role.character, audition: role.audition}
        case role
        when role.submitted
          submitted << r
        when role.invited_to_callbacks
          callbacks << r
        when role.cast_in_show
          cast << r
        else
          saved << r
        end
      end

      render json: {saved: saved, submitted: submitted, callbacks: callbacks, cast: cast}
    end
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
