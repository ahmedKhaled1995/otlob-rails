class RemoveStatusColumnsFromOrderFriend < ActiveRecord::Migration[6.1]
  def up
    remove_column :order_friends, :status
  end
end
