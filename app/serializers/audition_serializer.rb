class AuditionSerializer < ActiveModel::Serializer
  attributes :id, :date, :name_of_company, :name_of_show, :written_by, :director, :in_the_room, :union_status, :pay_scale, :materials_to_prepare, :cast_breakdown, :rehearsal_startdate, :show_startdate, :show_enddate, :show_warnings, :how_to_submit, :additional_notes, :created_at, :updated_at, :characters, :show_address, :audition_address, :theater
  # :theater_id, :address_id, :show_address_id
end