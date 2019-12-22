Rails.application.routes.draw do
  get 'cart_items/index'
  get 'cart_items/create'
  get 'cart_items/destroy'
  get 'cart_items/update'
  root 'home#index'
  get 'about' => "home#about"
  get 'customer/edit_password' => "customers#edit_password"
  post'customer/update_password' => "customers#update_password"
  get 'customer/new_Unsubscribe' => "customers#new_Unsubscribe"


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

  resources :customers, only: [:show, :edit, :update,:destroy]

  namespace :admin do
    resources :items
  end

  scope module: :customers do
    resources :admin, only: [:index,:show,:edit,:update,:destroy]
  end
  put "admin/:id/active/" => "customers/admin#active", as: "admin_active"

  resources :items, only: [:index, :show]
  get "cancel" => "items/cancel"
  resources :cart_items, only: [:index,:destroy,:create,:update]
end
