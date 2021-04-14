class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :edit, :update, :destroy]
   
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
    
    private
      def order_params
        params.require(:order).permit(:order_for, :from)
      end

      def set_order
        @order = Order.find(params[:id])
      end
end
