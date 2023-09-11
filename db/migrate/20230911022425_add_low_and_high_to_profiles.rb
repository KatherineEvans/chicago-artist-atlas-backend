class AddLowAndHighToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :age_low, :string
    add_column :profiles, :age_high, :string
  end
end
