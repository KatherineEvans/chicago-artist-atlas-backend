class TheatersController < ApplicationController

  def index
    theaters = Theater.all
    render json: theaters
  end

  def show
    theater = Theater.find(params[:id])
    render json: theater
  end
end
