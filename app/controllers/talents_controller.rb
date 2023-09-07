class TalentsController < ApplicationController
  
  def index
    render json: current_user.talents
  end

  def create
    talent = Talent.create(
      user_id: current_user.id,
      name: params[:name]
    )

    if talent.valid?
      render json: talent
    else
      render json: {errors: talent.errors.full_messages}, status: 422
    end
  end

  def destroy
    talent = Talent.find_by(id: params[:id], user_id: current_user.id)
    talent.destroy
    render json: {message: "Talent successfully removed"}
  end
  
end