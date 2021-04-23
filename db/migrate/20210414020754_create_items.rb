class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :amount
      t.integer :price
      t.text :comment

      t.timestamps
    end
  end
end
