Rails.application.routes.draw do
  namespace :backend do
    resources :areas
    resources :banners
    resources :users
    resources :images
    resources :properties
    resources :systems, only: [:index, :edit, :update]
  end

  resources :properties, only: [:show, :index]

  devise_for :users
  root to: 'pages#home'
end
