class User < ApplicationRecord
  # Include Devise JWT modules
  include Devise::JWT::RevocationStrategies::JTIMatcher

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true

  devise :database_authenticatable, :registerable, :recoverable, :trackable, :omniauthable, omniauth_providers: [:google_oauth2]
  
  devise :jwt_authenticatable, jwt_revocation_strategy: self
  has_many :trainings
  has_many :awards
  has_many :performances
  has_many :profiles
end
