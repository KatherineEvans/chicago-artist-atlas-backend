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

  resources :profiles, :except => [:new, :edit, :index, :destroy]
  resources :user_roles, :except => [:new, :edit]
end
