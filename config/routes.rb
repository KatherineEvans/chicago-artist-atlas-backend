Rails.application.routes.draw do
  
  post "/sessions" => "sessions#create"
  post "/users" => "users#create"
  get "/users" => "users#index"
  get "/theaters" => "theaters#index"
end
