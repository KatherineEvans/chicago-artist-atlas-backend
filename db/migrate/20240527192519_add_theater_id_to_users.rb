class AddTheaterIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :theater_id, :integer
  end
end
