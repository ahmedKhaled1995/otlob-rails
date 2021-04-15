class Friend < ApplicationRecord
  belongs_to :user
  has_many :group_friends
  belongs_to :order

  validates :email, presence: true
end
