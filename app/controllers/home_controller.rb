class HomeController < ApplicationController
  def index
    @latestOrders = Order.where(:user_id => current_user.id).last(4)
    return @latestOrders
  end
  def order_details
    render :layout => "application"
    def new
    end
  end
end