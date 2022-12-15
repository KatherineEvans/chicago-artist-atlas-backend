class TheatersController < ApplicationController
  def index
    theaters = Theater.all
    render json: theaters
  end
end
