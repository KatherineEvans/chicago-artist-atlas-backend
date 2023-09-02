Rails.application.routes.draw do
  # devise_for :users, defaults: { format: :json }        
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # post "/sessions" => "sessions#create"
  get "/theaters" => "theaters#index"
  get "/auditions" => "auditions#index"
  get "/profile" => "profiles#show"
  get "/resources" => "resources#index"

  # get "/user_roles" => "user_roles#index"
  # get "/user_roles/:id" => "user_roles#show"
  # post "/user_roles" => "user_roles#create"
  # delete "/user_roles/:id" => "user_roles#destroy"
  resources :user_roles, :except => [:new, :edit]
end
