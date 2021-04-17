class HomeController < ApplicationController
  def index
    @latesOrders = Order.where(:user_id => current_user.id).last(4)
    return @activities, @latesOrders
  end
  def order_details
    render :layout => "application"
    def new
    end
  end
end