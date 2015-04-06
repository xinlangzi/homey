Rails.application.routes.draw do

  namespace :backend do
    resources :banners
    resources :users
    resources :images
    resources :properties
  end

  devise_for :users
  root to: 'visitors#index'
end
