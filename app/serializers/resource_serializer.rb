class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :document_name, :organization_name, :pdf_url, :website_url, :primary_type, :secondary_type, :tertiary_type, :description, :logo, :free_tier

  belongs_to :address, optional: true
end
