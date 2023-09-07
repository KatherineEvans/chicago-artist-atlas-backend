class PerformancesController < ApplicationController
  
  def index
    render json: current_user.performances
  end

  def create
    performance = Performance.create(
      user_id: current_user.id,
      title: params[:title], 
      url: params[:url], 
      role: params[:role], 
      director: params[:director],
      musical_director: params[:musical_director],
      theater_group: params[:theater_group],
      running_date_start: params[:running_date_start],
      running_date_end: params[:running_date_end],
      timeframe: params[:timeframe], 
      description: params[:description]
    )

    if performance.valid?
      render json: performance
    else
      render json: {errors: performance.errors.full_messages}, status: 422
    end
  end

  def update
    performance = Performance.find_by(id: params[:id], user_id: current_user.id)
    performance.update(
      title: params[:title] || performance.title, 
      url: params[:url] || performance.url, 
      role: params[:role] || performance.role, 
      director: params[:director] || performance.director,
      musical_director: params[:musical_director] || performance.musical_director,
      theater_group: params[:theater_group] || performance.theater_group,
      running_date_start: params[:running_date_start] || performance.running_date_start,
      running_date_end: params[:running_date_end] || performance.running_date_end,
      timeframe: params[:timeframe] || performance.timeframe, 
      description: params[:description] || performance.description
    )

    if performance.valid?
      render json: performance
    else
      render json: {errors: performance.errors.full_messages}, status: 422
    end
  end

  def destroy
    performance = Performance.find_by(id: params[:id], user_id: current_user.id)
    performance.destroy
    render json: {message: "Performance successfully removed"}
  end
    
end
