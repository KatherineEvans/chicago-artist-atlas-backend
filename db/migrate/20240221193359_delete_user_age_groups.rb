class DeleteUserAgeGroups < ActiveRecord::Migration[7.0]
  def change
    drop_table :user_age_groups
  end
end
