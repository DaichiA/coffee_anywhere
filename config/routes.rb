Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup', to:'users#new'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  post '/logout', to:'sessions#destroy'
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :users do
    resources :reviews, only: [:index, :edit, :create]
    member do
      get :activate
    end
  end
  resources :shops do
    resources :reviews, only: [:edit]
    member do
      get :reviews
    end
  end
  resources :reviews, only: [:update, :destroy, :create]
end