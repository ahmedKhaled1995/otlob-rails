class AddOrderForeignkeyToGroup < ActiveRecord::Migration[6.1]
  def change
    add_reference :groups, :order, null: true, foreign_key: true
  end
end
