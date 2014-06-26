Rails.application.routes.draw do
  root 'sessions#new'

  resources :jobs do
    resources :interviews do
      resources :contacts
      resources :notes
    end
    resources :applies do
      resources :contacts
      resources :notes
    end
    resources :writings do
      resources :contacts
      resources :notes
    end
    resources :networks do
      resources :contacts
      resources :notes
    end
    resources :researches do
      resources :contacts
      resources :notes
    end
  end
  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  post '/', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get 'auth/failure', to: 'sessions#failure'
  get '/logout', to: 'sessions#destroy', as: :logout

end
