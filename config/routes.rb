Rails.application.routes.draw do
  root 'sessions#new'

  resources :jobs do
    resources :interviews
    resources :applies
    resources :writings
    resources :networks
    resources :researches
  end
  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  post '/', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get 'auth/failure', to: 'sessions#failure'
  get '/logout', to: 'sessions#destroy', as: :logout

end
