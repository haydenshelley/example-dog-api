Rails.application.routes.draw do
  get "/dogs" => "dogs#index"
  post "/dogs" => "dogs#create"

  post "/users" => "users#create"

  post "/sessions" => "sessions#create"
end
