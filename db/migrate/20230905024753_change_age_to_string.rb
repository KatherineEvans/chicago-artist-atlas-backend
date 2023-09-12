class ChangeAgeToString < ActiveRecord::Migration[7.0]
  def change
    change_column :profiles, :age, :string
  end
end
