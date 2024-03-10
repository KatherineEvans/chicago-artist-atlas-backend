class Profile < ApplicationRecord
  belongs_to :user
  has_many :user_ethnicities
  has_many :user_genders
end
