class TheatersController < ApplicationController
  def index
    theaters = Theater.all
    render json: theaters.as_json(methods: [:address])
  end
end
