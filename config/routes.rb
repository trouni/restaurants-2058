Rails.application.routes.draw do
  # the prefix ONLY refers to the path (not the http verb)
  # http_verb '/path_in_the_browser', to: 'controller#action', as: :prefix
  # CRUD routes - 7
  # Read all of my restaurants
  get '/restaurants', to: 'restaurants#index', as: :restaurants

  # Create a restaurant in 2 steps: 1 action for form / 1 action to create the instance
  # one page just for the form itself
  get '/restaurants/new', to: 'restaurants#new', as: :new_restaurant
  # this action is just to create the instance ()
  post '/restaurants', to: 'restaurants#create'

  # one page just for the form itself
  get '/restaurants/:id/edit', to: 'restaurants#edit', as: :edit_restaurant
  # this action is just to update the instance
  patch '/restaurants/:id', to: 'restaurants#update', as: :restaurant

  # delete a restaurant
  delete '/restaurants/:id', to: 'restaurants#destroy'

  # Read one of my restaurants
  # /restaurants/1
  get '/restaurants/:id', to: 'restaurants#show'
end

# get restaurants_path
# post restaurants_path

# get restaurant_path(restaurant)
# path restaurant_path(restaurant)
# delete restaurant_path(restaurant)
