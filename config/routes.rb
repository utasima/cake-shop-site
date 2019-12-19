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
  get 'costomers/edit'
  get 'costomers/show'
  get 'costomers/update'
  get 'costomers/cancel'
  
  devise_for :users
end
