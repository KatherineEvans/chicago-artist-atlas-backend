class TalentsController < ApplicationController
    def talents
        talents = Talent.where(talent_type: nil)
        render json: talents.as_json
    end

    def sorted_talents
        talents = Talent.where(talent_type: nil)
    
        sorted_categories = {}
        talents.each do |talent|
          if sorted_categories[talent.category]
            sorted_categories[talent.category] << talent
          else
            sorted_categories[talent.category] = [talent]
          end
        end
    
        render json: sorted_categories.as_json
    end

    def tech_talents
        tech_talents = Talent.where(talent_type: 'tech')
        render json: tech_talents.as_json
    end
end
