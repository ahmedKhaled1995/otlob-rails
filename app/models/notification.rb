class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :friend

  enum type: [:invitation, :accepted]


end
