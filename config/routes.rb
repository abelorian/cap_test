Rails.application.routes.draw do
  get 'home/index'

  resources :customers
  resources :cities
  resources :countries
  root 'home#index'
end
