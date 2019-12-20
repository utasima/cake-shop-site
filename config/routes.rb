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
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  resources :items
  get "cancel" => "items/cancel"

  namespace :admin do
    resources :items
  end
  resources :cart_items, only: [:index,:destroy,:create,:update]
end
