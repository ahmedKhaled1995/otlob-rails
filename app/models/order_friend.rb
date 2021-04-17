class OrderFriend < ApplicationRecord
  belongs_to :friend
  belongs_to :order
  enum status: [:invited, :joined, :canceled]
end
