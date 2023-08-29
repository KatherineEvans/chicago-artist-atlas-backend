class UserRoleSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :character_id, :submitted, :submitted_date, :invited_to_callbacks, :cast_in_show

  belongs_to :character
  has_one :audition, through: :character
end
