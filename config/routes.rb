Rails.application.routes.draw do
  root 'static_pages#home'
  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
  get '/signup', to:'users#new'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  post '/logout', to:'sessions#destroy'
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :users do
    resources :reviews, only: [:index, :create]
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
  resources :favorites, only: [:create, :destroy]
end