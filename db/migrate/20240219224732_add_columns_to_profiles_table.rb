class AddColumnsToProfilesTable < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :other_ethnicities, :string
    add_column :profiles, :tech_manager, :string
    add_column :profiles, :tech_agent, :string
    add_column :profiles, :acting_reel_url, :string
    add_column :profiles, :portfolio_url, :string
  end
end
