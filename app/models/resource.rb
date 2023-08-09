class Resource < ApplicationRecord
  belongs_to :address, optional: true
end
