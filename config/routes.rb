require 'sidekiq/web'

Rails.application.routes.draw do
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
  end

  resources :properties, only: [:show, :index]
  resources :inquiries, only: [:new, :create]

  devise_for :users
  root to: 'pages#home'
end
