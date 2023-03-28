class AddRehearsalAndAuditionTimeToTheaters < ActiveRecord::Migration[7.0]
  def change
    add_column :theaters, :typical_rehearsal_time, :string
    add_column :theaters, :typical_audition_time, :string
  end
end
