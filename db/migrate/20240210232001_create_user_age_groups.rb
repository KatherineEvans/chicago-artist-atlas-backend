class CreateUserAgeGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :user_age_groups do |t|
      t.integer :age_group_id
      t.integer :user_id
      t.integer :profile_id

      t.timestamps
    end
  end
end
