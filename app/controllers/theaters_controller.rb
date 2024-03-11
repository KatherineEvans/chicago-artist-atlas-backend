class TheatersController < ApplicationController

  def index
    # pagination 
    # page_number = params[:page_number] || 1
    # page_size = params[:page_size] || 5
    # page_starts_at = ((page_number.to_i - 1) * page_size.to_i)

    theaters = Theater.all

    # if params[:search] && params[:search] != "null" && params[:search].length > 0
    #   theaters = theaters.where("name iLIKE ?", "%#{params[:search]}%")
    # end

    # if params[:equity] && params[:equity] != "null"
    #   theaters = theaters.where(union_status: params[:equity])
    # end

    # if params[:season] && params[:season] != "null"
    #   theaters = theaters.where("season_type iLIKE ?", "%#{params[:season]}%")
    # end

    # theaters = theaters.order("name ASC").limit(page_size.to_i).offset(page_starts_at.to_i)

    render json: theaters
  end
end
