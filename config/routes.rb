Rails.application.routes.draw do

#home
  get "/" => "home#top"

#topic
  get "topics/index" => "topics#index"
  get "topics/top" => "topics#top"
  post "topics/create" => "topics#create"
  post "topics/:id/destroy" => "topics#destroy"
  get "topics/:id/edit" => "topics#edit"
  post "topics/:id/update" => "topics#update"
  get "topics/:id" => "topics#show"
 
#post

  post "posts/:id/create" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
#user
  get "users/new" => "users#new"
  post "users/create" => "users#create"
  get "login" => "users#login_form"
  post "users/login" => "users#login"
  get "users/:id" => "users#show"
  post "logout" => "users#logout"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update"=> "users#update"



  #question 
   get "first_question" => "questions#first_question"
   get "questions/:id/show" => "questions#show"
   get "questions/:id/:point" => "questions#count_point"
   get  "questions/sum" => "questions#sum"
   get "questions/result" => "questions#result"




  # position 
  
  post "positions/create" => "positions#create"
  
end



