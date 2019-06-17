Rails.application.routes.draw do
  resources :dashboard, only: [:index]
  resources :rooms do
    get :network_manager
  end
  resources :switches
  resources :computers do
    post :enable_network_access
  end
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
