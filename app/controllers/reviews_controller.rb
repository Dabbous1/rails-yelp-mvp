class ReviewsController < ApplicationController

  def new
    @reviews = Reviews.new          # GET /restaurants/new
  end

  def create
    review = Review.new(review_params)
    restaurant = Restaurant.find(params[:restaurant_id])
    review.restaurant = restaurant
    review.save
    redirect_to review_path     # POST /restaurants
  end
  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:reviews).permit(:content, :rating)
  end
end


