class CreateAuditions < ActiveRecord::Migration[7.0]
  def change
    create_table :auditions do |t|
      t.string :name_of_company
      t.integer :theater_id
      t.string :union_status
      t.string :pay_scale
      t.string :name_of_show
      t.string :written_by
      t.string :director
      t.string :musical_director
      t.string :choreographer
      t.string :in_the_room
      t.string :materials_to_prepare
      t.string :how_to_submit
      t.datetime :rehearsal_startdate
      t.datetime :tech_startdate
      t.datetime :previews_startdate
      t.datetime :show_startdate
      t.datetime :show_enddate
      t.integer :show_address_id
      t.string :show_warnings
      t.text :show_description
      t.string :additional_notes
      t.datetime :audition_date1
      t.string :audition_time1
      t.datetime :audition_date2
      t.string :audition_time2
      t.datetime :audition_date3
      t.string :audition_time3
      t.datetime :audition_date4
      t.string :audition_time4
      t.datetime :audition_date5
      t.string :audition_time5
      t.datetime :callback_date1
      t.string :callback_time1
      t.datetime :callback_date2
      t.string :callback_time2
      t.datetime :callback_date3
      t.string :callback_time3
      t.integer :audition_address_id

      t.timestamps
    end
  end
end
