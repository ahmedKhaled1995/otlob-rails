class HomeController < ApplicationController
  def index
    # @latestOrders = Order.where(:user_id => current_user.id).last(4)
    # @orders = Order.all
    # @users = User.all
    # return @orders, @latestOrders

    @latest_Orders = current_user.orders.last(5)
    @latest_frineds_orders = helpers.get_latest_friends_order
    return @latest_Orders, @latest_frineds_orders
  end
  
  # def order_details
  #   render :layout => "application"
  #   def new
  #   end
  # end

end