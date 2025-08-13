class ReviewsController < ApplicationController

  # '/restaurants/52/reviews/new'
  def new
    # only for the form (we need both the review AND restaurant)
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # we have to submit a form to get here -> post restaurants/52/reviews
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      raise
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
