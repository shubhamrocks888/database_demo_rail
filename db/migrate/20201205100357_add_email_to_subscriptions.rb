class AddEmailToSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :email, :string
  end
end
