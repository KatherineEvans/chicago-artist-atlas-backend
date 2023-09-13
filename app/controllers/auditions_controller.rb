class AuditionsController < ApplicationController
  def index
    # pagination 
    # search = params[:search]
    # page_number = params[:page_number] || 1
    # page_size = params[:page_size] || 5
    # page_starts_at = ((page_number.to_i - 1) * page_size.to_i)

    # if search 
    #   auditions = Audition.where("name LIKE ?", "%#{search}%")
    #   page_number = 1
    #   page_starts_at = ((page_number.to_i - 1) * page_size.to_i)
    # else
    auditions = Audition.all.where("created_at > ?", 5.days.ago)
    # end

    # auditions = auditions.order("name ASC").limit(page_size.to_i).offset(page_starts_at.to_i)

    render json: auditions
  end
  
end
