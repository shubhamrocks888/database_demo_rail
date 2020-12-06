class PriceColumnDatatypeChangeOfSubscriptions < ActiveRecord::Migration[5.0]
  def up
        change_column :subscriptions, :price, :decimal
    end

  def down
        change_column :subscriptions, :price, :integer
    end
end
