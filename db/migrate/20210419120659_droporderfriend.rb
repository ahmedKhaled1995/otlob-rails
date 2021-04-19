class Droporderfriend < ActiveRecord::Migration[6.1]
  def change
    drop_table :order_friends
  end
end
