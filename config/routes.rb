Rails.application.routes.draw do
  root to: "restaurants#index"
  devise_for :users
  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]
  # all of our top restaurant
  # get '/restaurants/top', to: 'restaurants#top', as: :top_restaurants
  # see a chef page for a specific restaurant
  # get '/restaurants/:id/chef', to: 'restaurants#chef', as: :restaurant_chef
end

# Custom Non-CRUD routes
# collection  -> about all of the restaurants (aka no ID)
# member      -> one specific restaurant (aka need ID)


# collection do
#   get 'top'
# end
# member do
#   get 'chef'
# end

# get restaurants_path
# post restaurants_path

# get restaurant_path(restaurant)
# path restaurant_path(restaurant)
# delete restaurant_path(restaurant)
