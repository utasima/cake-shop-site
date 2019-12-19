Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'about' => "home#about"

  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'orders/confirmation'
  get 'orders/thanks'
  get 'orders/destroy'
  get 'orders/create'
  get 'items/cancel'
  get 'costomers/edit'
  get 'costomers/show'
  get 'costomers/update'
  get 'costomers/cancel'
  
  devise_for :users

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  resources :items

  namespace :admin do
    resources :items
  end
end
