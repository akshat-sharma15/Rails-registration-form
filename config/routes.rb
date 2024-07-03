Rails.application.routes.draw do
  root "users#index"   

  resources :users do
    resources :subjects
  end
  # get "/users", to: "users#index"
  # get "/users/new", to: "users#new"
end
