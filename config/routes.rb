Rails.application.routes.draw do
  root 'welcome#index'

  resources :jobs do
    get :deleted_index, on: :collection
    member do
      get 'content'
      get 'content_edit'
      put :new_network
      patch :new_network
      put :new_interview
      patch :new_interview
    end
  end

  resources :notes
  resources :contacts

  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  post '/', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get 'auth/failure', to: 'sessions#failure'
  get '/logout', to: 'sessions#destroy', as: :logout
end
