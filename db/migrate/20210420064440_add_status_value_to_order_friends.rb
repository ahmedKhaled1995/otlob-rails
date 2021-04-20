class AddStatusValueToOrderFriends < ActiveRecord::Migration[6.1]
  def change
    add_column :order_friends, :status, :boolean, :default => false
  end
end
