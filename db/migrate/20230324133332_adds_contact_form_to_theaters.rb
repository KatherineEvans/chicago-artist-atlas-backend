class AddsContactFormToTheaters < ActiveRecord::Migration[7.0]
  def change
    add_column :theaters, :contact_form, :string
  end
end
