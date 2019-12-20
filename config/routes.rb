Rails.application.routes.draw do
  get 'cart_items/index'
  get 'cart_items/create'
  get 'cart_items/destroy'
  get 'cart_items/update'
  root 'home#index'
  get 'about' => "home#about"

  resources :costomers, only: [:show, :edit, :update]
  get "cancel" => 'costomers/cancel'

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  namespace :admin do
    resources :items
  end
  
  resources :items, only: [:index, :show]
  get "cancel" => "items/cancel"
  resources :cart_items, only: [:index,:destroy,:create,:update]
end
