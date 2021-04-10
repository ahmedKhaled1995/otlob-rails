class Friend < ApplicationRecord
  belongs_to :user
  has_many :group_friends

  validates :email, presence: true
end
