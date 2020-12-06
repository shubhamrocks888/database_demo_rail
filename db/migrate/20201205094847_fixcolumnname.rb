class Fixcolumnname < ActiveRecord::Migration[5.0]
  def up
    rename_column :subscriptions, :price, :money
end

def down
    rename_column :subscriptions, :money, :price
end
end
