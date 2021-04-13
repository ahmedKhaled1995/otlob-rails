class FriendsController < ApplicationController
    def index
        @friends = Friend.where(user_id: current_user.id)
        @pics = Array.new
        @friends.each do |friend|
            user = User.find_by(email: friend.email)
            if user
                @pics.push(user.get_image)
            else
                @pics.push(helpers.get_avatar(friend.email))
            end
        end
        puts @pics
    end

    def new
        @friend = Friend.new
    end

    def create
        @friend = Friend.new(friend_params)

        @friend.user_id = current_user.id

        if @friend.save
            redirect_to action: "index"
        else
            render :new
        end
    end

    def destroy
        @friend = Friend.find(params[:id])

        # Before we delete the friend, we must first check if this friend
        # is added to a group 
        @friend.group_friends.each do |group_friend|
            group_friend.destroy
        end

        # Now we destroy the friend
        @friend.destroy
    
        redirect_to action: "index"
    end

    private
    def friend_params
        # puts '-------------->>>>>'
        # puts params
        # puts '--------------<<<<<'
        # params.require(:friend).permit(:email)
        params.permit(:email)
    end

end
