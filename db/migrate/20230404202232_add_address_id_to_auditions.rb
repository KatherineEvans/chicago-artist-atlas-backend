class AddAddressIdToAuditions < ActiveRecord::Migration[7.0]
  def change
    add_column :auditions, :address_id, :integer
    remove_column :auditions, :location, :string
  end
end
