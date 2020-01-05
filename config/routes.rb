Rails.application.routes.draw do
  root 'home#index'
  get 'about' => "home#about"

  get 'customer/edit_password' => "customers#edit_password"
  post'customer/update_password' => "customers#update_password"
  get 'customer/new_Unsubscribe' => "customers#new_Unsubscribe"
  get 'orders/confirmation' => "orders#confirmation"
  get 'orders/thanks' => "orders#thanks"

  get "admin/top" => "admin/orders#top"

	delete 'cart_items/all_destroy' => "cart_items#all_destroy"
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
  get "admin/search/genre", to: "admin/items#genre_search"

  namespace :admin do
    resources :items
    resources :customers
    resources :genres
    resources :orders
    resources :order_items
  end


  post 'admin/genres', to: 'admin/genres#create', as: 'create_admin_genre'
  patch 'admin/genres/:id/regeneration', to: 'admin/genres#regeneration', as: 'regeneration_admin_genre'

  patch 'admin/items/:id/regeneration', to: 'admin/items#regeneration', as: 'regeneration_item_genre'

  resources :deliver_infos
  post 'deliver_infos', to: 'deliver_infos#create', as: 'create_deliver_info'

  resources :customers, only: [:show, :edit, :update,:destroy]

  scope module: :customers do
    resources :admin, only: [:index,:show,:edit,:update,:destroy]
  end

  put "admin/:id/active/" => "customers/admin#active", as: "admin_active"

  resources :items, only: [:index, :show]
  get "search/genre", to: "items#genre_search"
  get "cancel" => "items/cancel"

  resources :cart_items, only: [:index,:destroy,:create,:update]

  resources :orders
end

