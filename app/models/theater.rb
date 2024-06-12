class Theater < ApplicationRecord
  belongs_to :performance_address, optional: true, foreign_key: "performance_address_id", class_name: "Address"
  belongs_to :business_address, optional: true, foreign_key: "business_address_id", class_name: "Address"
  has_many :auditions
  has_many :users
end
