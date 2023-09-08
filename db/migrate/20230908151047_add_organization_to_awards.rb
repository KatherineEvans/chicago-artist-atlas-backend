class AddOrganizationToAwards < ActiveRecord::Migration[7.0]
  def change
    add_column :awards, :organization, :string
  end
end
