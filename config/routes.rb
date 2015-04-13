Rails.application.routes.draw do

  namespace :backend do
    resources :areas
  end
  namespace :backend do
    resources :banners
    resources :users
    resources :images
    resources :properties
  end

  resources :properties, only: [:show, :index]

  devise_for :users
  root to: 'properties#index'
end
