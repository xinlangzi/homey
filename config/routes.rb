Rails.application.routes.draw do
  namespace :backend do
    resources :areas
    resources :banners
    resources :users
    resources :images
    resources :properties
    resources :systems, only: [:index, :edit, :update]
    resources :inquiries, exclude: [:new, :create]
  end

  resources :properties, only: [:show, :index]
  resources :inquiries, only: [:new, :create]

  devise_for :users
  root to: 'pages#home'
end
