class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :destroy]

   
    def index
      @orders = Order.all

      # @order_friends = {friends: []}
      # @orders.each do |order|
      #   @order_fri=OrderFriend.where(order_id:order.id)
      #   @order_friends[:friends] <<  @order_fri

      # # @orders.each do |order|
      # #    @order_friends=OrderFriend.where(order_id:order.id)
      # # p "hnaaaaaaaaaaaaaaaaaaaaaaaa" 
      # # p @order_friends
      # end
     

  
      # @friends = Friend.where(user_id: current_user.id)
      # @friends.each do |friend|
      #   user = User.find_by(email: friend.email)
      # end
      # @q = Friend.ransack(params[:q])
      # @people = @q.result(distinct: true)
    end
  
    def show
      # Checking if the order to be view is created by the user
      if @order.user.id == current_user.id
        return
      end

      @invited_user = NIL
      @order.order_friends.each do |order_friend|
        if order_friend.friend.email == current_user.email
          @invited_user = order_friend
          break
        end
      end
      
      if @invited_user
        # Updating the status of the accepted user to be accepted
        if @invited_user.status == false
          @invited_user.status = true;
          if @invited_user.save
            # Notifing the order creator than the invited user has accepted the invitaion
            Notification.notify_accept(@order, current_user)
            return 
          else
            return redirect_to orders_path, alert: "Error occured. Please try again"
          end
        end
      else
        flash.now[:error] = "You are not/no longer invited to this order!"
        return
      end
    end
  
    def new
      @order = Order.new
    end

# // get all the ids from table
    def order_friend_params

      @listofIds =params[:formData]
      session[:passed_variable] = @listofIds
    end

# // i save friend id in friend_order not user id
    def create
    #  // list of ids of all friends added to the order
      @listofIds = session[:passed_variable] 
      @get_value = @listofIds
      session[:passed_variable]=[]
      # p "value------------------"
      # p @get_value

    # 1st restaurant -> 2nd order -> 3rd order_friends
    # if restaurant_params != ""
      @restaurant = Restaurant.new(restaurant_params)
      if @restaurant.save
            @order = Order.new(order_params)
            @order.restaurant_id= @restaurant.id
            @order.user_id= current_user.id

            if @order.save
              if @get_value != nil
                @get_value.each do |currentfriendid|
                  #@friends=Friend.find_by(id: currentfriendid)
                  @order_friend=OrderFriend.new
                  @order_friend.friend_id=currentfriendid
                  @order_friend.order_id= @order.id
                    
                      if  @order_friend.save
                          p "friend is added to order---------------------"
                      else
                          p "friend is not added to order-------------------"
                          render :new
                      end
                end
                p "order is added----------------------"

                # Ahmad Khaled added code for inviting friends added to that order
                # puts '******************************'
                @order.order_friends.each do |order_friend|
                  Notification.notify_invite(order_friend)
                end
                # puts '******************************'

                redirect_to @order
                # format.html {flash[:notice] = 'Employee was successfully created.' and redirect_to action: "index"}   
              else
                p "order is added----------------------"
                redirect_to @order
              end
            else
              p "order is not added-------------------"
              render :new
            end

        p "restaurant is added----------------------"
      else
        p "restaurant is not added-------------------"
        #  render :new
        # redirect_to '/orders/new'
      end
    # else
    #   p "-----------------------empty resaurant--------------------"
    # end
      
    end
  
    def edit
    end
    
    def destroy
      @order = Order.find(params[:id])
      @order.destroy
  
      redirect_to root_path
    end

    def change_status_to_completed
      @order = Order.find(params[:id])
      @order.update(status: params[:status] )
      redirect_to '/orders'
      # redirect_to @order
    end
    
    def change_status_to_canceled
      @order = Order.find(params[:id])
      @order.update(status: params[:status])
      redirect_to '/orders'
      # redirect_to @order
    end

     

def addGrouptoOrder
  group_name = params[:group_name]
    @group = Group.find_by(user_id: current_user.id,name:group_name)
    
  # // 2 arrays 1 for friends ids and another for same user instance 
    @friendsingroup = {friends: []}
    @friendsingroupids={friendsid: []}

    @results = @group.group_friends.each do |group_friend|
   
    @friendsingroupids[:friendsid] <<  group_friend.friend.id
   
    @users=User.find_by(email:group_friend.friend.email)
    @friendsingroup[:friends] <<  @users

    
  end


  respond_to do |format|
    format.html
    format.json { render json: [@friendsingroupids, @friendsingroup]}
  end
end


    def addFriendtoOrder
     
      friend_email = params[:friend_email]
   
      @friends=Friend.find_by(email: friend_email)
      @friendid=Friend.find_by(email: friend_email).id
# // not use user directly in case he writes email not of his friends       
      @user=User.find_by(email: @friends.email)

      respond_to do |format|
        format.html
        format.json {render json: [@friendid, @user]}


      end
    end



    private
      def order_params
        params.require(:order).permit(:order_for)
      end

      def restaurant_params
        params.require(:order).permit(:name, :menu)
      end
      


      def set_order
        @order = Order.find(params[:id])
      end

end

