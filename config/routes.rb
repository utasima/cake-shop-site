Rails.application.routes.draw do
  root 'home#index'
  get 'about' => "home#about"

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
  resources :customers, only: [:show, :edit, :update]
  resources :items
  get "cancel" => "items/cancel"

  namespace :admin do
    resources :items

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
