class CreateAwards < ActiveRecord::Migration[7.0]
  def change
    create_table :awards do |t|
      t.integer :user_id
      t.string :name
      t.integer :year
      t.string :url
      t.text :note

      t.timestamps
    end
  end
end
