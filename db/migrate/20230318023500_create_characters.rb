class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :age
      t.string :gender
      t.string :ethnicity
      t.string :description
      t.text :skills
      t.text :warnings
      t.text :notes
      t.integer :audition_id

      t.timestamps
    end
  end
end
