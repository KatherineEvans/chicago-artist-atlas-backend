class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone, :date_of_birth, :address, :trainings, :awards, :performances, :profiles, :user_roles, :talents, :user_ethnicities, :user_genders

  has_many :trainings
  has_many :awards
  has_many :performances
  has_many :profiles
  has_many :user_roles
  has_many :talents
  belongs_to :address, optional: true
  has_many :user_ethnicities
  has_many :user_genders
  # belongs_to :company, optional: true
end
