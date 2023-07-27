class CreatePerformances < ActiveRecord::Migration[7.0]
  def change
    create_table :performances do |t|
      t.integer :user_id
      t.string :title
      t.integer :address_id
      t.string :url
      t.string :role
      t.string :director
      t.string :musical_director
      t.string :theater_group
      t.string :running_date_start
      t.string :running_date_end
      t.string :timeframe
      t.text :description

      t.timestamps
    end
  end
end
