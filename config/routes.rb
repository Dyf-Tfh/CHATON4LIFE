Rails.application.routes.draw do
  root 'items#index'
  get 'items/index'
  get 'items/:id/show', to: 'items#show', as: 'item'
  devise_for :users
  get 'mon_panier', to: 'cart#show', as: 'mon_panier'
  delete 'mon_panier/:item', to: 'cart#delete', as: 'mon_panier_delete'
  get 'user/profile', to: 'user#show', as: 'profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items
end
