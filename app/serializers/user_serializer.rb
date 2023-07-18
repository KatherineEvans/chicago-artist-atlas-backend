class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :address, :trainings, :awards, :performances, :profiles

  has_many :trainings
  has_many :awards
  has_many :performances
  has_many :profiles
  belongs_to :address, optional: true
  
end
