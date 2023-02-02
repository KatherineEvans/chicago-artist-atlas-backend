class TheatersController < ApplicationController
  def index
    theaters = Theater.all.limit(5)
    render json: theaters
  end
end
