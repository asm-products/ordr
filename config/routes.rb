Rails.application.routes.draw do

  resources :jobs do
    resources :interviews
    resources :applies
    resources :writings
    resources :networks
    resources :researches
  end

  get '/login', to: 'sessions#new', as: :login
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'sessions/failure', to: 'sessions#failure'
  get '/logout', to: 'sessions#destroy', as: :logout

end
