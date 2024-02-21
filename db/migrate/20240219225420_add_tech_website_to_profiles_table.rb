class AddTechWebsiteToProfilesTable < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :tech_website, :string
  end
end
