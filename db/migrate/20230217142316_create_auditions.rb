class CreateAuditions < ActiveRecord::Migration[7.0]
  def change
    create_table :auditions do |t|
      t.string :date
      t.string :name_of_company
      t.string :name_of_show
      t.string :written_by
      t.string :director
      t.string :in_the_room
      t.string :location
      t.string :union_status
      t.string :pay_scale
      t.text :materials_to_prepare
      t.text :cast_breakdown
      t.datetime :rehearsal_startdate
      t.datetime :show_startdate
      t.datetime :show_enddate
      t.string :show_location
      t.string :show_warnings.
      
      t.text :how_to_submit
      t.text :additional_notes

      t.timestamps
    end
  end
end
