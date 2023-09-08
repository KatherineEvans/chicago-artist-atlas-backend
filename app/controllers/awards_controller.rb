class AwardsController < ApplicationController

  def index
    render json: current_user.awards
  end

  def create
    award = Award.create(
      user_id: current_user.id,
      name: params[:name], 
      year: params[:year], 
      url: params[:url], 
      note: params[:note],
      organization: params[:organization]
    )

    if award.valid?
      render json: award
    else
      render json: {errors: award.errors.full_messages}, status: 422
    end
  end

  def update
    award = Award.find_by(id: params[:id], user_id: current_user.id)
    award = Award.create(
      name: params[:name] || award.name, 
      year: params[:year] || award.year, 
      url: params[:url] || award.url, 
      organization: params[:organization] || award.organization,
      note: params[:note] || award.note
    )

    if award.valid?
      render json: award
    else
      render json: {errors: award.errors.full_messages}, status: 422
    end
  end

  def destroy
    award = Award.find_by(id: params[:id], user_id: current_user.id)
    award.destroy
    render json: {message: "Award successfully removed"}
  end

end