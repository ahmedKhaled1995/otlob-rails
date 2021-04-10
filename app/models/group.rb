class Group < ApplicationRecord
  belongs_to :user
  has_many :group_friends, dependent: :delete_all

  validates :name, presence: true
end
