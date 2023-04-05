class Theater < ApplicationRecord
  belongs_to :address, optional: true, :foreign_key => "performance_address_id"
  has_many :auditions
end
