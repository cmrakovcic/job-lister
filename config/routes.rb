Rails.application.routes.draw do
  root "sessions#home"
 
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
 
  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
 
  #logout route
  delete '/logout' => 'sessions#destroy'
 
  resources :jobs do
     resources :reviews
  end
   resources :reviews
   resources :users do
     resources :jobs, shallow: true
  end
end