class AuditionsController < ApplicationController
  def index
    auditions = Audition.all
    render json: auditions
  end
  
end
