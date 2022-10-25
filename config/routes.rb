Rails.application.routes.draw do
  # ingredients
  get '/ingredients', to: 'ingredients#index'

  # recipes
  get '/recipes/:id', to: 'recipes#show'
end
