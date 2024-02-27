class Talent < ApplicationRecord
  has_many :user_talents
  has_many :user_tech_talents
end
