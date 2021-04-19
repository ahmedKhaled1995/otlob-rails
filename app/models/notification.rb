class Notification < ApplicationRecord
  belongs_to :receiver, :class_name => "User"
  belongs_to :order
  belongs_to :sender, :class_name => "User"

  enum category: [:invite, :accepte]

  # This method is for testing and debugging only
  def self.create(sender_id, receiver_id, category)
    new_notification = Notification.new
    new_notification.receiver_id = receiver_id
    new_notification.category = category
    new_notification.order_id = 1
    new_notification.sender_id = sender_id
    new_notification.viewed = false
    new_notification.save()
    data = {
      :receiver => new_notification.receiver,
      :category => category,
      :order => new_notification.order,
      :sender => new_notification.sender,
      :viewed => new_notification.viewed
    }
    puts data
    ActionCable.server.broadcast("notification_channel_#{receiver_id}", data)   # notification_channel_user_id
  end

end