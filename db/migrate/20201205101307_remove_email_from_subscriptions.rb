class RemoveEmailFromSubscriptions < ActiveRecord::Migration[5.0]
  def change
    remove_column :subscriptions, :email, :string
  end
end
