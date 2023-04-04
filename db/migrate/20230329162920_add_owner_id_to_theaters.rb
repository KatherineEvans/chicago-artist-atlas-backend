class AddOwnerIdToTheaters < ActiveRecord::Migration[7.0]
  def change
    add_column :theaters, :owner_id, :integer
  end
end
