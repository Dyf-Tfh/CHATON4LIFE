Rails.application.routes.draw do
  get 'order/index'
  get 'order/show'
  get 'order/new'
  get 'order/create'
  root 'items#index'
  get 'items/index'
  get 'items/:id/show', to: 'items#show', as: 'item'
  devise_for :users
  get 'users/:id/mon_panier', to: 'cart#show', as: 'mon_panier'
  delete 'users/:id/mon_panier/:item', to: 'cart#delete', as: 'mon_panier_delete'
  get 'user/profile', to: 'user#show', as: 'profile'

  get 'items/add/:id', to: 'items#add'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items
  resources :charges
end
