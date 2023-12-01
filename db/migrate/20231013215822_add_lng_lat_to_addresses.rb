class AddLngLatToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :lng, :string
    add_column :addresses, :lat, :string
  end
end
