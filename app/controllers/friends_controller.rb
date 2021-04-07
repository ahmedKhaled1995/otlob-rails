class FriendsController < ApplicationController
    def index
        @friends = Friend.where(user_id: current_user.id)
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
        @friend.destroy
    
        redirect_to action: "index"
    end

    private
    def friend_params
        puts params
        # params.require(:friend).permit(:email)
        params.permit(:email)
    end

end
