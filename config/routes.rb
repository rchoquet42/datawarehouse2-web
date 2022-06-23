Rails.application.routes.draw do
  get '/about', to: "about#index"
  get '/authors', to: "authors#index"
  get '/teaching', to: "teaching_materials#index"
  get '/users', to: "users#index"
  delete '/users', to: "users#delete"
  post '/users', to: "users#new"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "about#index"
end
