class AddTypeToTalentCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :talent_categories, :type, :string
  end
end
