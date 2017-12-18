Rails.application.routes.draw do
  root "users#index" #renders the initial page to either login or register
  post 'users/create' => 'users#create' #action of registering a new user
  post '/sessions/create' => 'sessions#create' #completes action of logging user in
  get 'ideas' => 'users#ideas' #renders the page that shows all the ideas, user landing page
  
  get '/users/:id' => 'users#show' #renders a page that show's a user's information
  get '/ideas/:id' => 'users#list' #renders a page that lists all the likers for a certain post
  post 'posts/create' => 'posts#create' #post route to create a new post
  post '/likes/:id' => 'likes#create' #post route to create a user/post 'like' relationship
  delete '/posts/:id' => 'posts#destroy'
  delete 'sessions/:id' => 'sessions#destroy' #logs a user out
  
  
end
