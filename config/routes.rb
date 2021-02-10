Rails.application.routes.draw do
  # get 'oauths/oauth'
  # get 'oauths/callback'
  get '/hi', to: 'static_pages#home' # Vueテスト
  # APIコントローラへのルーティング
  # namespace :api, {format: 'json'} do
  #   namespace :v1 do
  #     resources :sessions, only: [:create]
  #     resources :shops, only: [:index]
  #   end
  # end
  post 'oauth/callback' => 'oauths#callback'
  get 'oauth/callback' => 'oauths#callback' # for use with Github, Facebook
  get 'oauth/:provider' => 'oauths#oauth', :as => :auth_at_provider
  root 'static_pages#home'
  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  resources :password_resets, only: %i[new create edit update]
  resources :users do
    resources :reviews, only: %i[index create]
    resources :notifications, only: [:index]
    member do
      get :activate
    end
  end
  resources :shops do
    member do
      get :reviews
    end
  end
  resources :reviews, only: [:destroy]
  resources :favorites, only: %i[create destroy]
  resources :comments, only: %i[create destroy]
end
