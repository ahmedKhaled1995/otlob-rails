class Notification < ApplicationRecord
  belongs_to :receiver, :class_name => "User"
  belongs_to :order
  belongs_to :sender, :class_name => "User"

  enum category: [:invite, :accepte]

  # This method is for testing and debugging only
  def self.create(user_id)
    new_notification = Notification.new
    new_notification.receiver_id = 2
    new_notification.category = 0
    new_notification.order_id = 1
    new_notification.sender_id = 1
    new_notification.viewed = false
    new_notification.save()
    ActionCable.server.broadcast("notification_channel_#{user_id}", new_notification)   # notification_channel_user_id
  end

end
