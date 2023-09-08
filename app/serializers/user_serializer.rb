class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone, :date_of_birth, :address, :trainings, :awards, :performances, :profiles, :user_roles, :talents

  has_many :trainings
  has_many :awards
  has_many :performances
  has_many :profiles
  has_many :user_roles
  has_many :talents
  belongs_to :address, optional: true
  # belongs_to :company, optional: true
  
end
