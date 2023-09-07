class TrainingsController < ApplicationController

  def index
    render json: current_user.trainings
  end

  def create
    training = Training.create(
      user_id: current_user.id,
      institution: params[:institution], 
      city: params[:city], 
      state: params[:state], 
      degree: params[:degree], 
      year: params[:year],
      note: params[:note]
    )
  
    if training.valid?
      render json: training
    else
      render json: {errors: training.errors.full_messages}, status: 422
    end
  end

  def update
    training = Training.find_by(id: params[:id], user_id: current_user.id)
    training.update(
      institution: params[:institution] || training.institution, 
      city: params[:city] || training.city, 
      state: params[:state] || training.state, 
      degree: params[:degree] || training.degree, 
      year: params[:year] || training.year,
      note: params[:note] || training.note
    )
  
    if training.valid?
      render json: training
    else
      render json: {errors: training.errors.full_messages}, status: 422
    end
  end

  def destroy
    training = Training.find_by(id: params[:id], user_id: current_user.id)
    training.destroy
    render json: {message: "Training successfully removed"}
  end

end