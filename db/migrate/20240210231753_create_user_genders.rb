class CreateUserGenders < ActiveRecord::Migration[7.0]
  def change
    create_table :user_genders do |t|
      t.integer :gender_id
      t.integer :user_id
      t.integer :profile_id

      t.timestamps
    end
  end
end
