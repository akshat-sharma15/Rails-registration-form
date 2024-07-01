Rails.application.routes.draw do
  root "users#index"   

  resources :users

  # get "/users", to: "users#index"
  # get "/users/new", to: "users#new"
end
