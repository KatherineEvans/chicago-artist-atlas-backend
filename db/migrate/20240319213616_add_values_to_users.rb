class AddValuesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :chargebee_customer_id, :string
    add_column :users, :chargebee_subscription_id, :string
  end
end
