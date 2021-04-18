class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :destroy]
   
    def index
      @orders = Order.all
      # @friends = Friend.where(user_id: current_user.id)
      # @friends.each do |friend|
      #   user = User.find_by(email: friend.email)
      # end
      # @q = Friend.ransack(params[:q])
      # @people = @q.result(distinct: true)
    end
  
    def show
    end
  
    def new
      @order = Order.new
    end
  
    def create
      @order = Order.new(order_params)
     
      if @order.save
        redirect_to @order
      else
        render :new
      end
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
 
  @friendsingroup = {friends: []}
  @results = @group.group_friends.each do |group_friend|
    @friendsingroup[:friends] <<  group_friend.friend 
  end


  respond_to do |format|
    format.html
    format.json { render json: @friendsingroup}
  end
end


    def addFriendtoOrder
     
      friend_email = params[:friend_email]
   
      @friends=Friend.find_by(email: friend_email)

      respond_to do |format|
        format.html
        format.json {render json: @friends}


      end
    end


   




    private
      def order_params
        params.require(:order).permit(:order_for)
      end

      def set_order
        @order = Order.find(params[:id])
      end

end

