Rails.application.routes.draw do
  root "sessions#home"

  get '/users/most-active' => 'users#most_active'

  get '/categories' => 'categories#index'
 
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
 
  delete '/logout' => 'sessions#destroy'

  get "/auth/:provider/callback" => 'sessions#google'

  resources :jobs do
    resources :reviews
  end

  resources :reviews
  resources :users do
    resources :jobs, shallow: true
  end

  resources :categories, only: [:index, :show]
end
