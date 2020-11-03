Rails.application.routes.draw do
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
  root 'static_pages#home'
  get '/signup', to:'users#new'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  post '/logout', to:'sessions#destroy'
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :users do
    member do
      get :activate
    end
  end
end