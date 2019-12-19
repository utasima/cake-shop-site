Rails.application.routes.draw do
  root 'home#index'
  get 'a_about' => "home#about"

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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
