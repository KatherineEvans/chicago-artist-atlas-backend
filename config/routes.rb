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
  get "/talent-categories" => "talents#categories"
  
  resources :awards, :except => [:new, :edit, :show]
  resources :performances, :except => [:new, :edit, :show]
  resources :profiles, :except => [:new, :edit, :index, :destroy]
  resources :talents, :except => [:new, :edit, :show]
  resources :trainings, :except => [:new, :edit, :show]
  resources :user_roles, :except => [:new, :edit, :show]

end
