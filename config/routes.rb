Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :admin, only: [:index, :create, :update, :destroy]
  resources :client, only: [:index, :create, :update, :destroy]
  resources :trainer, only: [:index, :create, :update, :destroy]
end
