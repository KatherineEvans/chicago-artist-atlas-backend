class AddOtherToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :other_gender, :string
    add_column :profiles, :other_pronouns, :string
  end
end
