class OrderFriend < ApplicationRecord
  belongs_to :order
  belongs_to :friend
  # enum status: [:invited, :joined, :canceled]
end
