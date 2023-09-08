class AddItemsToTalents < ActiveRecord::Migration[7.0]
  def change
    add_column :talents, :talent_category_id, :integer
    add_column :talents, :level, :string
    add_column :talents, :other, :string
  end
end
