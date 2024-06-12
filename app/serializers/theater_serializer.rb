class TheaterSerializer < ActiveModel::Serializer
  attributes :id, :name, :business_address_id, :performance_address_id, :website, :contact_name, :contact_email, :casting_director, :casting_email, :notes, :season_type, :union_status, :image_url, :active, :mission, :phone, :venue, :childrens, :contact_form, :owner_id

  belongs_to :performance_address, optional: true, foreign_key: "performance_address_id", class_name: "Address"
  belongs_to :business_address, optional: true, foreign_key: "business_address_id", class_name: "Address"
end
