class AddKeepPrivateToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :keep_private, :boolean, defalut: false
  end
end
