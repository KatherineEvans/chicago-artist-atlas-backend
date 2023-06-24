Rails.application.routes.draw do
  # devise_for :users, defaults: { format: :json }        
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # post "/sessions" => "sessions#create"
  get "/users" => "users#index"
  get "/theaters" => "theaters#index"
  get "/auditions" => "auditions#index"
end
