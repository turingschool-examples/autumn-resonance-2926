Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/ingredients', to: 'ingredients#index'

  patch '/recipes/:id', to: 'recipes#update'
  get '/recipes/:id', to: 'recipes#show'
end
