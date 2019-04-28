Rails.application.routes.draw do
  resources :dashboard, only: [:index]
  resources :rooms
  resources :switches
  resources :computers
  resources :ports
  namespace :account do
    resources :users
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dashboard#index"
end
