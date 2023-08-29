class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :character
  has_one :audition, through: :character
end
