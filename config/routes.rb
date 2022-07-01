Rails.application.routes.draw do
  
  post "/sessions" => "sessions#create"
  post "/users" => "users#create"
end
