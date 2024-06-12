class AddItemsToTheaters < ActiveRecord::Migration[7.0]
  def change
    add_column :theaters, :music_director, :string
    add_column :theaters, :choreographer, :string
  end
end
