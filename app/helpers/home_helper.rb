module HomeHelper

    def get_latest_friends_order
        current_user_friends = current_user.friends
        latest_friends_orders = []
        current_user_friends.each do |friend|
            friend_as_user = User.find_by(email: friend.email)
            friend_as_user.orders.last(2).each do |friend_order|
                latest_friends_orders.push(friend_order)
            end
        end
        return latest_friends_orders
    end

end
