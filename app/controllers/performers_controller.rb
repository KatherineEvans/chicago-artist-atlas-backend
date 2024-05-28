class PerformersController < ApplicationController
    def index
        performers = Profile.includes(:user_genders, :user_ethnicities, user: [:talents, :trainings, :awards, :performances]).all

        # if params[:search]
        #     performers = performers.where("title ILIKE ?", "%#{params[:search]}%")
        # end

        performers = performers.order(:id => :asc)
        render json: performers.as_json(include: { user_genders: {}, user_ethnicities: {}, user: { include: [:talents, :trainings, :awards, :performances] } })
    end
end
