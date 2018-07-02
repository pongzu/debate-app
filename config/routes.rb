Rails.application.routes.draw do

  get "/" => "topics#index"
  get "topics/top" => "topics#top"
  post "topics/create" => "topics#create"
  get "topics/:id" => "topics#show"

#postのルート

  post "posts/:id/create" => "posts#create"
  get "posts/:id" => "posts#show"


#user
  get "login_form" => "users#login_form"
  get "users/:id" => "users#show"
  post "users/:id/login" => "users#login"
  post "users/:id/create" => "users#create"
end
