require 'sidekiq/web'

Rails.application.routes.draw do
  resources :requests
  mount Ckeditor::Engine => '/ckeditor'
  mount Sidekiq::Web, at: '/sidekiq'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development? || Rails.env.capybara?

  namespace :backend do
    resources :areas
    resources :banners
    resources :users
    resources :images
    resources :properties
    resources :systems, only: [:edit, :update]
    resources :inquiries, only: [:show, :index, :destroy]
    resources :requests, only: [:show, :index, :destroy]
    resources :news_items
  end

  resources :properties, only: [:show, :index]
  resources :inquiries, only: [:new, :create]
  resources :news_items, only: [:show, :index]
  resources :subleases

  devise_for :users
  get '/our_service', to: 'pages#our_service'
  get '/contact_us', to: 'pages#contact_us'
  root to: 'pages#home'

end
