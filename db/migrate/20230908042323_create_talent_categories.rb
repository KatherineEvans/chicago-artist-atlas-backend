class CreateTalentCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :talent_categories do |t|
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
