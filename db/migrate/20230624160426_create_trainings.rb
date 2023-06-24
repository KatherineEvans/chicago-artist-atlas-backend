class CreateTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :trainings do |t|
      t.string :institution
      t.string :city
      t.string :state
      t.string :degree
      t.text :note
      t.integer :user_id

      t.timestamps
    end
  end
end
