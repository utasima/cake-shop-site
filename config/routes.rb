Rails.application.routes.draw do
  get 'costomers/edit'
  get 'costomers/show'
  get 'costomers/update'
  get 'costomers/cancel'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
