class DropAgeGroups < ActiveRecord::Migration[7.0]
  def change
    drop_table :age_groups
  end
end
