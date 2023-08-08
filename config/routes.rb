Rails.application.routes.draw do
  get "/dogs" => "dogs#index"
  post "/dogs" => "dogs#create"
  patch "/dogs/:id" => "dogs#update"

  post "/users" => "users#create"

  post "/sessions" => "sessions#create"
end
