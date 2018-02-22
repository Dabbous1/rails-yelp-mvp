class RestaurantsController < ApplicationController
  # before_action :set_restaurant only: [:show, :edit, :destroy, :update ]
  def index
    @restaurants = Restaurant.all        # GET /restaurants
  end

  def show
  end

  def new
    @restaurant = Restaurant.new          # GET /restaurants/new
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    restaurant.save
    redirect_to restaurants_path      # POST /restaurants
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number,  :category)
  end
end


