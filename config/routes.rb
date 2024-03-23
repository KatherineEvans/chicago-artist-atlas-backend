Rails.application.routes.draw do
  # devise_for :users, defaults: { format: :json }        
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # post "/sessions" => "sessions#create"
  get "/addresses" => "addresses#add_lat_lng"
  get "/theaters" => "theaters#index"
  get "/auditions" => "auditions#index"
  get "/profile" => "profiles#show"
  get "/resources" => "resources#index"
  get "/talent-categories" => "talents#sorted_talents"
  get "/tech-talents" => "talents#sorted_tech_talents"
  post "/tech-talents" => "profiles#process_tech_talents"
  get "/current_user" => "users#show"
  patch "/current_user" => "users#update"
  post "/notify-me" => "users#notify_me"
  get "/profile_elements" => "profiles#profile_elements"
  
  resources :awards, :except => [:new, :edit, :show]
  resources :performances, :except => [:new, :edit, :show]
  resources :profiles, :except => [:new, :edit, :index, :destroy]
  resources :user_talents, :except => [:new, :edit, :show]
  resources :trainings, :except => [:new, :edit, :show]
  resources :user_roles, :except => [:new, :edit, :show]

  # routes.rb
  post "/generate_checkout_new_url" => "chargebee#checkout_new"

end
