Rails.application.routes.draw do
  namespace :backend do
    resources :banners
    resources :users
  end
  
  devise_for :users#, path: "backend/users"
  root to: 'visitors#index'
end
