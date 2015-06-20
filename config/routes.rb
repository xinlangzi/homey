# require 'sidekiq/web'

Rails.application.routes.draw do
  resources :requests
  mount Ckeditor::Engine => '/ckeditor'
  # mount Sidekiq::Web, at: '/sidekiq'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development? || Rails.env.capybara?

  namespace :backend do
    resources :base
    resources :areas
    resources :banners
    resources :users do
      resources :orders
    end
    resources :orders, only: [:index, :show] do
      member do
        patch :renew_lease
        patch :renew_internet
      end
    end
    resources :images
    resources :properties do
      member do
        post :default_image
      end
    end
    resources :systems, only: [:edit, :update]
    resources :inquiries, only: [:show, :index, :destroy]
    resources :requests, only: [:show, :index, :destroy]
    resources :news_items
    resources :subleases
  end

  resources :properties, only: [:show, :index]
  resources :inquiries, only: [:new, :create]
  resources :news_items, only: [:show, :index]
  resources :subleases

  devise_for :users
  get '/our_service', to: 'pages#our_service'
  get '/contact_us', to: 'pages#contact_us'
  get '/backend', to: 'backend/base#index'
  root to: 'pages#home'

end
