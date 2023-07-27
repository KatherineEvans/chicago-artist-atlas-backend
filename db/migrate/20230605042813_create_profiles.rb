class CreateProfiles < ActiveRecord::Migration[7.0]
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
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
      t.string :headline
      t.text :bio
      t.timestamps
    end

    add_index :profiles, :user_id
  end

  def self.down
    drop_table :profiles
  end

end