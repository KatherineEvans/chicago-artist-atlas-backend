class AddYearToTrainings < ActiveRecord::Migration[7.0]
  def change
    add_column :trainings, :year, :integer
  end
end
