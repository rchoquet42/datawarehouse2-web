Rails.application.routes.draw do
  get '/about', to: "about#index"
  get '/authors', to: "authors#index"
  get '/teaching', to: "teaching_materials#index"
  get '/users', to: "users#index"
  delete '/users', to: "users#delete"
  post '/users', to: "users#new"

  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"

  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token


  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"

  resources :passwords, only: [:create, :edit, :new, :update], param: :password_reset_token

  put "account", to: "users#update"
  get "account", to: "users#edit"
  delete "account", to: "users#destroy"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "about#index"
end
