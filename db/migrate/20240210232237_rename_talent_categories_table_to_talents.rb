class RenameTalentCategoriesTableToTalents < ActiveRecord::Migration[7.0]
  def change
    rename_table :talent_categories, :talents
  end
end
