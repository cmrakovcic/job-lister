Rails.application.routes.draw do
  root "sessions#home"
 
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
 
  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
 
  #logout route
  delete '/logout' => 'sessions#destroy'

   resources :reviews
   resources :users do
     resources :jobs, only: [:new, :create, :index]
   end
   resources :jobs do
     resources :reviews, only: [:new, :create, :index]
   end

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end