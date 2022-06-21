class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :company_id
      t.string :email
      t.datetime :email_verified
      t.string :password_digest
      t.string :phone
      t.datetime :date_of_birth
      t.integer :address_id
      t.string :metadata
      t.datetime :last_logged_in_at
      t.datetime :tos_accepted_at
      t.string :union_status
      t.string :ethnicity
      t.string :pronouns
      t.string :gender
      t.string :height
      t.string :eye_color
      t.string :hair_color
      t.string :vocal_range
      t.string :instruments_played
      t.string :talents
      t.string :performance_types
      t.string :agency
      t.string :manager
      t.string :professional_website
      t.string :headshot_url
      t.string :resume_url

      t.timestamps
    end
  end
end
