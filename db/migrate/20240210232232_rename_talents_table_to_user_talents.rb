class RenameTalentsTableToUserTalents < ActiveRecord::Migration[7.0]
  def change
    rename_table :talents, :user_talents
  end
end
