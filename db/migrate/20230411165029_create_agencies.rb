class CreateAgencies < ActiveRecord::Migration[7.0]
  def change
    create_table :agencies do |t|
      t.string :name
      t.integer :address_id
      t.string :website
      t.string :submission_guidelines
      t.string :union_status

      t.timestamps
    end
  end
end
