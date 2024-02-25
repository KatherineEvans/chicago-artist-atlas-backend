class UserTechTalent < ApplicationRecord
    belongs_to :talent
    belongs_to :user
end
