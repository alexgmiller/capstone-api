Rails.application.routes.draw do
post "/users" => "users#create"
post "/sessions" => "sessions#create"
get "/users" => "users#index"
get "/users/:id" => "users#show"

get "/games" => "games#index"
get "/games/:id" => "games#show"
post "/games" => "games#create"
patch "/games/:id" => "games#update"
delete "/games/:id" => "games#destroy"

get "/posts" => "posts#index"
get "posts/:id" => "posts#show"
post "/posts" => "posts#create"
delete "/posts/:id" => "posts#destroy"
patch "/posts:id" => "posts#update"
end
