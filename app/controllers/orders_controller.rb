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

    def addFriendtoOrder
     

     # friend_email = params[:friend_email]
      user_id = params[:user_id]

      # email = friend_params.require(:email)
      # user = User.find_by(email: email)
      # if !user
      #     redirect_to friends_path, alert: "The user doesn't exist!"
      #     return
      # end
    
      @friends=Friend.where(user_id: user_id)
      #@friends=User.find_by(id: friend_email)
      @groups = Group.where(user_id: current_user.id)

      # @group = Group.find(params[:group_id])
      # @friendsingroups = @group.group_friends.find(params[:id])


      #@test=some_parameter
      respond_to do |format|
        format.html
        format.json {render json: @friends}
      end
    end

    # def show_options
   
    # end


    

    private
      def order_params
        params.require(:order).permit(:order_for)
      end

      def set_order
        @order = Order.find(params[:id])
      end

end

