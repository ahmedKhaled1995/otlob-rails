class Friend < ApplicationRecord
  belongs_to :user
  has_many :group_friends
  belongs_to :order, optional: true


  validates :email, presence: true

  # before_save :check_friend

  # private
  #   def check_friend(friend_record)
  #     friend_exists = false
  #     current_user.friends.each do |user_friend|
  #       if user_friend.email == friend_record.email
  #         friend_exists = true
  #       end
  #     end
  #     if friend_exists || friend_record.email == current_user.email
  #       errors.add(:email, "already exists")
  #     end
  #   end

end
