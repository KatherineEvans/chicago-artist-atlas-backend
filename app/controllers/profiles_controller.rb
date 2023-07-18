class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = current_user
    pp current_user
    render json: @user
  end
end
