Rails.application.routes.draw do
  root 'items#index'
  get 'items/index'
  get 'items/show'
  devise_for :users
  get 'user/:id/mon_panier', to: 'cart#show', as: 'mon_panier'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items
end
