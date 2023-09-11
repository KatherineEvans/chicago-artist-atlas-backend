class RemoveAgeFromProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :age, :string
  end
end
