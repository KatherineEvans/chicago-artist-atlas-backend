class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :address, :trainings, :awards, :performances, :profiles, :user_roles

  has_many :trainings
  has_many :awards
  has_many :performances
  has_many :profiles
  has_many :user_roles
  belongs_to :address, optional: true
  
end
