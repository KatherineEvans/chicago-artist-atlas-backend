class ChangeTalentCategoryIdOnUserTalents < ActiveRecord::Migration[7.0]
  def change
    rename_column :user_talents, :talent_category_id, :talent_id
  end
end
