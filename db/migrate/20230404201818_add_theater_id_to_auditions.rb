class AddTheaterIdToAuditions < ActiveRecord::Migration[7.0]
  def change
    add_column :auditions, :theater_id, :integer
  end
end
