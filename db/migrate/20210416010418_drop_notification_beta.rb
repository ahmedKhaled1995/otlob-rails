class DropNotificationBeta < ActiveRecord::Migration[6.1]
  def up
    drop_table :notification_beta
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
