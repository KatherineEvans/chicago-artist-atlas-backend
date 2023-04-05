class AddShowAddressIdToAuditions < ActiveRecord::Migration[7.0]
  def change
    add_column :auditions, :show_address_id, :integer
    remove_column :auditions, :show_location
  end
end
