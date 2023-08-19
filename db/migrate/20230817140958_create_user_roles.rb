class CreateUserRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_roles do |t|
      t.integer :user_id
      t.integer :character_id
      t.boolean :submitted
      t.datetime :submitted_date
      t.boolean :invited_to_callbacks
      t.boolean :cast_in_show

      t.timestamps
    end
  end
end
