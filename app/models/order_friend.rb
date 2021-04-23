class OrderFriend < ApplicationRecord
  belongs_to :order
  belongs_to :friend, class_name: 'User'
end
