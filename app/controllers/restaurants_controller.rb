class RestaurantsController < ApplicationController
  # '/restaurants'
  def index
    @restaurants = Restaurant.all
    # render 'index.html.erb'
  end

  # '/restaurants/1'
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  # '/restaurants/new'
  def new
    # just for the form builder
    @restaurant = Restaurant.new
  end

  # to get to this action, i have to submit a form -> post /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      # if it saves, go to the show page
      redirect_to restaurant_path(@restaurant)
    else
      # show the form again with the restaurant that didnt save
      render 'new', status: :unprocessable_entity
    end
  end

  # '/restaurants/2/edit'
  def edit
    # is just for the form
    @restaurant = Restaurant.find(params[:id])
  end

  # to get to this action, i have to submit a form -> patch /restaurants/1
  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      # if it saves, go to the show page
      redirect_to restaurant_path(@restaurant)
    else
      # show the form again with the restaurant that didnt save
      render 'edit', status: :unprocessable_entity
    end
  end

  # to get to this action, we have to click a button -> delete
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:rating, :name, :address)
  end
end
