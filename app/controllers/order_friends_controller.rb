class OrderFriendsController < ApplicationController
  def index
    if(params[:status] == "0")
    
      @orders_friends = OrderFriend.where(order:params[:order_id],status:0)
      @invitbit="0"
      @order=params[:order_id]
    
    elsif (params[:status] == "1")
      @orders_friends = OrderFriend.where(order:params[:order_id],status:1)
      @invitbit="1"
      @order=params[:order_id]
    else  # All members
      @orders_friends = OrderFriend.where(order:params[:order_id])
      @invitbit="2"
      @order=params[:order_id]
    end
    
  end



  def show
  end

  def destroy
    @order_friend = OrderFriend.find(params[:id])
    @order_friend.destroy

         
    @userid=User.find_by(email: @order_friend.friend.email).id 
    @item=Item.where(order_id:params[:order_id] ,user_id:@userid)
   
    @item.each do |currentitem|
      currentitem.destroy
    end

     if params[:status] == "0"
       redirect_to order_order_friends_path(params[:order_id],status:0), notice: "Friend deleted successfully from invited friends .."
     else
      redirect_to order_order_friends_path(params[:order_id],status:1), notice: "Friend deleted successfully from joined friend .."
     end


  end
end
