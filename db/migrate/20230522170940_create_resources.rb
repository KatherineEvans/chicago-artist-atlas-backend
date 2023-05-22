class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.string :document_name
      t.string :organization_name
      t.string :pdf_url
      t.string :website_url
      t.string :type
      t.string :sub_type
      t.string :description
      t.string :logo
      t.boolean :free_tier

      t.timestamps
    end
  end
end
