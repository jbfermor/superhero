Rails.application.routes.draw do
  resources :reviews
  resources :heros
  
  devise_for :users, path: "", path_names: {
    sign_in: "login",
    sign_out: "logout",
    registration: "sign up"
    },
    controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
    }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
