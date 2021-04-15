class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :destroy]
   
    def index
      @orders = Order.all
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

    private
      def order_params
        params.require(:order).permit(:order_for)
      end

      def set_order
        @order = Order.find(params[:id])
      end
end
