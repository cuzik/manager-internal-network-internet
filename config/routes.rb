Rails.application.routes.draw do
  resources :dashboard, only: [:index]
  resources :rooms
  resources :switches
  resources :computers
  resources :ports, only: [:show, :update, :destroy, :new, :edit, :create]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dashboard#index"
end
