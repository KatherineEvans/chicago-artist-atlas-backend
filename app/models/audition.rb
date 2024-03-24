class Audition < ApplicationRecord
  has_many :characters
  has_many :user_roles, through: :characters
  belongs_to :theater, optional: true
  belongs_to :audition_address, class_name: "Address", foreign_key: "audition_address_id", optional: true
  belongs_to :show_address, class_name: "Address", foreign_key: "show_address_id", optional: true 
  belongs_to :callback_address, class_name: "Address", foreign_key: "callback_address_id", optional: true 
end
