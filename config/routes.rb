Rails.application.routes.draw do
  namespace :backend do
    resources :photos
  end
  namespace :backend do
    resources :banners
    resources :users
    resources :properties
  end
  
  devise_for :users
  root to: 'visitors#index'
end
