Rails.application.routes.draw do

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
  resources :users, only: [:new, :create]

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create', as: :email_login
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'sessions/failure', to: 'sessions#failure'
  get '/logout', to: 'sessions#destroy', as: :logout

end
