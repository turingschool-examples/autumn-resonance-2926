Rails.application.routes.draw do
  # ingredients
  get '/ingredients', to: 'ingredients#index'
end
