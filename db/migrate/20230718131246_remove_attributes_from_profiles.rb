class RemoveAttributesFromProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :instruments_played, :string
    remove_column :profiles, :talents, :string
  end
end
