class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :order_for, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true

      
      t.timestamps
    end
  end
end
