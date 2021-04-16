class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :type
      t.references :order, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: true
      t.boolean :viewed

      t.timestamps
    end
  end
end
