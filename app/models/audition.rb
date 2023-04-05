class Audition < ApplicationRecord
  has_many :characters
  belongs_to :theater
  belongs_to :audition_address, class_name: "Address", foreign_key: "address_id"
  belongs_to :show_address, class_name: "Address", foreign_key: "show_address_id", optional: true
end
