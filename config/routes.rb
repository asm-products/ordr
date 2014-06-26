Rails.application.routes.draw do
  resources :jobs

  root 'sessions#new'
  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  post '/', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get 'auth/failure', to: 'sessions#failure'
  get '/logout', to: 'sessions#destroy', as: :logout

end
