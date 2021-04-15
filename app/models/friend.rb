class Friend < ApplicationRecord
  belongs_to :user
  has_many :group_friends
  has_many :notification_betas

  validates :email, presence: true
end
