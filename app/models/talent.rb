class Talent < ApplicationRecord
  belongs_to :talent_category
  belongs_to :user
end
