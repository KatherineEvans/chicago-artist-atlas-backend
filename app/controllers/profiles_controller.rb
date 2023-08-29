class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    render json: current_user
  end
end
