class CreateUserTechTalents < ActiveRecord::Migration[7.0]
  def change
    create_table :user_tech_talents do |t|
      t.integer :talent_id
      t.integer :user_id
      t.string :level
      t.string :other

      t.timestamps
    end
  end
end
