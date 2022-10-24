Rails.application.routes.draw do
  get '/ingredients', to: 'ingredients#index'

  get '/recipes/:id', to: 'recipes#show'
  post '/recipes/:id', to: 'recipes#create'
end
