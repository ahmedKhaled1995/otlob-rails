class CreateOrderFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :order_friends do |t|
      t.references :order, null: false, foreign_key: true
      t.references :friend
      t.boolean :status, :default => false

      t.timestamps
    end
  end
end
