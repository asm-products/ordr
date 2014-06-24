Rails.application.routes.draw do
  resources :notes

  resources :interviews do
    resources :contacts, shallow: true
  end
  resources :applies do
    resources :contacts, shallow: true
  end
  resources :writings do
    resources :contacts, shallow: true
  end
  resources :networks do
    resources :contacts, shallow: true
  end
  resources :researches do
    resources :contacts, shallow: true
  end


  resources :jobs do
    resources :interviews
    resources :applies
    resources :writings
    resources :networks
    resources :researches
  end
  resources :users, only: [:new, :create]

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create', as: :email_login
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'sessions/failure', to: 'sessions#failure'
  get '/logout', to: 'sessions#destroy', as: :logout

end
