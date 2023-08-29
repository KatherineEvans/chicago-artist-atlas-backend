class CharactersController < ApplicationController

  # def create 
  #   render json: {message: "hey"}
  # end

  def 
    user_role = UserRole.find(params[:id])
    render json: user_role
  end

end
