class UserTalentsController < ApplicationController
  
  def index
    user_talents = current_user.user_talents
    render json: user_talents, methods: [:talent]
  end

  def tech_talents
    user_tech_talents = current_user.user_tech_talents
    render json: user_tech_talents, methods: [:talent]
  end

  def create
    current_user.user_talents.destroy_all
    
    if params[:talents]
      params[:talents].each do |key, _value|
        talent = UserTalent.create(
          user_id: current_user.id,
          talent_id: key
        )
      end
    end
    
    if params[:other]
      params[:other].each do |key, value|
        category = Talent.find_by(category: key, name: "Other", talent_type: nil)
        value.each do |val|
          talent = UserTalent.create(
            user_id: current_user.id,
            talent_id: category.id,
            other: val
          )
        end
      end
    end
    
    render json: {message: "Success"}
    
  end

  def destroy
    talent = Talent.find_by(id: params[:id], user_id: current_user.id)
    talent.destroy
    render json: {message: "Talent successfully removed"}
  end
  
end