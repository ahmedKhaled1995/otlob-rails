class RestaurantsController < ApplicationController
    def new
        @restaurant = Restaurant.new
      end

      def create
        @restaurant = Restaurant.new(restaurant_params)
    
        if @restaurant.save
          redirect_to @restaurant
        else
          render :new
        end
      end
      def show 
        @restaurant = Restaurant.find(params[:id])

      end

      private
      def restaurant_params
        params.require(:restaurant).permit(:name, :menu)
      end
end
