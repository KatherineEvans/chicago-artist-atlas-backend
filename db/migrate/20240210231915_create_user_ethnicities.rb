class CreateUserEthnicities < ActiveRecord::Migration[7.0]
  def change
    create_table :user_ethnicities do |t|
      t.integer :ethnicity_id
      t.integer :user_id
      t.integer :profile_id

      t.timestamps
    end
  end
end
