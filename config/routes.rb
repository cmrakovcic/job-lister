Rails.application.routes.draw do
  get '/signup' => 'users#new'
  # resources :categories
  resources :reviews
  resources :users
  resources :jobs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
