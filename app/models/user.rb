class User < ApplicationRecord
  # Include Devise JWT modules
  include Devise::JWT::RevocationStrategies::JTIMatcher

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true

  devise :database_authenticatable, :registerable, :recoverable, :trackable, :omniauthable, :validatable, omniauth_providers: [:google_oauth2]
  
  devise :jwt_authenticatable, jwt_revocation_strategy: self
  has_many :trainings
  has_many :awards
  has_many :performances
  has_many :profiles
  has_many :user_roles
  has_many :user_talents
  has_many :user_tech_talents
  has_many :talents, through: :user_talents
  has_many :user_ethnicities
  has_many :user_genders
  belongs_to :address, optional: true
  # belongs_to :company, optional: true
end
