Rails.application.routes.draw do
  resources :jobs do
      get :deleted_index, on: :collection
    member do
      put :new_network
      patch :new_network
      put :new_interview
      patch :new_interview
    end

  end
  root 'sessions#new'
  resources :users, only: [:new, :create, :show] do
  end

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  post '/', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get 'auth/failure', to: 'sessions#failure'
  get '/logout', to: 'sessions#destroy', as: :logout

end
