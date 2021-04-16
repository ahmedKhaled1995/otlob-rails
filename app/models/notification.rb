class Notification < ApplicationRecord
  belongs_to :recipient, :class_name => "User"
  belongs_to :order
  belongs_to :sender, :class_name => "User"

  enum type: [:invitation, :accepted]
end
