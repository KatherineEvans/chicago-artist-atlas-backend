class AddHowToSubmitLinkToAuditions < ActiveRecord::Migration[7.0]
  def change
    add_column :auditions, :how_to_submit_link, :string
  end
end
