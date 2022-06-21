class CreateTheaters < ActiveRecord::Migration[7.0]
  def change
    create_table :theaters do |t|
      t.string :name
      t.integer :business_address_id
      t.integer :performance_address_id
      t.string :website
      t.string :contact_name
      t.string :contact_email
      t.string :casting_director
      t.string :casting_email
      t.string :notes
      t.string :season_type
      t.string :union_status
      t.string :image_url
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
