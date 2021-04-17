class CreateOrderFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :order_friends do |t|
      t.string :status
      t.references :friend, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
