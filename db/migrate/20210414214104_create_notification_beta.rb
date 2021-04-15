class CreateNotificationBeta < ActiveRecord::Migration[6.1]
  def change
    create_table :notification_beta do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: true
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
