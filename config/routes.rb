Rails.application.routes.draw do
post "/users" => "users#create"
post "/sessions" => "sessions#create"
get "/users" => "users#index"
get "/users/:id" => "users#show"
get "/games" => "games#index"
get "/games/:id" => "games#show"
get "/posts" => "posts#index"
delete "/posts/:id" => "posts#destroy"
patch "/posts:id" => "posts#update"
end
