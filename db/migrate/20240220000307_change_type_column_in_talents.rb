class ChangeTypeColumnInTalents < ActiveRecord::Migration[7.0]
  def change
    rename_column :talents, :type, :talent_type
  end
end
