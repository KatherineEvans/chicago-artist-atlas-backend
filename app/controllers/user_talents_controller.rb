class UserTalentsController < ApplicationController
  
  def index
    user_talents = current_user.user_talents
    render json: user_talents, methods: [:talent]
  end

  def categories
    talent_categories = TalentCategory.all

    sorted_categories = {}
    talent_categories.each do |tc|
      if sorted_categories[tc.category]
        sorted_categories[tc.category] << tc
      else
        sorted_categories[tc.category] = [tc]
      end
    end

    render json: sorted_categories.as_json
  end

  def create
    current_user.talents.destroy_all
    
    if params[:talents]
      params[:talents].each do |key, _value|
        talent = Talent.create(
          user_id: current_user.id,
          talent_category_id: key
        )
      end
    end
    
    if params[:other]
      params[:other].each do |key, value|
        category = TalentCategory.find_by(category: key, name: "Other")
        value.each do |val|
          talent = Talent.create(
            user_id: current_user.id,
            talent_category_id: category.id,
            other: val
          )
        end
      end
    end
    
    render json: {message: "You did it!"}
    
  end

  def destroy
    talent = Talent.find_by(id: params[:id], user_id: current_user.id)
    talent.destroy
    render json: {message: "Talent successfully removed"}
  end
  
end