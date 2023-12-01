class AddressSerializer < ActiveModel::Serializer
  attributes :id, :address1, :address2, :address3, :city, :state, :country, :postal_code,  :full_address, :lat, :lng
end
