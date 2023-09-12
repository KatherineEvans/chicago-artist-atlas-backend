class Character < ApplicationRecord
  belongs_to :audition
  has_many :user_roles
end
