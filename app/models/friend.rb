class Friend < ApplicationRecord
  belongs_to :user
  has_many :group_friends
  belongs_to :order

  has_many :notification_betas

  validates :email, presence: true
end
