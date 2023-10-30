Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/user-profile', to: 'users/registrations#show'
  # patch '/users', to: 'users/registrations#users'
  # delete '/logout', to: 'session#destroy'
  devise_scope :user do
    get '/users', to: 'users/registrations#index'
    patch '/users', to: 'users/registrations#update'
    delete '/delete', to: 'users/registrations#destroy'
  end
  resources :workouts
  resources :users
  resources :admin, only: %i[index create update destroy]
  resources :client, only: %i[index create update destroy]
  resources :trainer, only: %i[index create update destroy]

end
