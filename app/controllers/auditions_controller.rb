class AuditionsController < ApplicationController
  def index
    auditions = Audition.where(
      "(audition_date1 >= :today OR audition_date1 IS NULL) AND
       (audition_date2 >= :today OR audition_date2 IS NULL) AND
       (audition_date3 >= :today OR audition_date3 IS NULL) AND
       (audition_date4 >= :today OR audition_date4 IS NULL) AND
       (audition_date5 >= :today OR audition_date5 IS NULL)",
      { today: Date.current }
    )
    render json: auditions
  end

  def show
    render json: Audition.find(params[:id]),  methods: [:characters, :show_address, :callback_address, :audition_address]
  end
end
