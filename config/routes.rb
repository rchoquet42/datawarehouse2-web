Rails.application.routes.draw do
  get '/about', to: "about#index"
  get '/authors', to: "authors#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "about#index"
end
