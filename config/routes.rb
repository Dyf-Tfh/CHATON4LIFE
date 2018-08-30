Rails.application.routes.draw do
  root 'items#index'
  get 'items/:id/show', to: 'items#show', as: 'item'
  devise_for :users
  get 'mon_panier', to: 'carts#show', as: 'mon_panier'
  delete 'mon_panier/:item', to: 'carts#delete', as: 'mon_panier_delete'
  get 'user/profile', to: 'user#show', as: 'profile'

  get 'items/add/:id', to: 'items#add'
  get 'config/active_storage/route_yolo', to: 'item#config'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items
  resources :charges
  resources :orders
  resources :carts
end
