Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :admin, only: [:index, :create, :update, :destroy]
  resources :client, only: [:index, :create, :update, :destroy]
  resources :trainer, only: [:index, :create, :update, :destroy]

  # Client/Member routes
  resources :client_membership, only: [:index, :create, :update, :destroy]
  resources :client_payment, only: [:index, :create]
  resources :gym_review, only: [:index, :create, :update, :destroy]
  resources :progress_tracking, only: [:index, :create, :update, :destroy]

  # Trainer/Staff routes
  resources :client_review, only: [:index, :create, :update, :destroy]
  resources :client_trainer_relationship, only: [:index, :create, :update, :destroy]

  # Administrator routes
  resources :role, only: [:index, :create, :update, :destroy]
  resources :permissions, only: [:index, :create, :update, :destroy]
  resources :trainer_performance, only: [:index, :create, :update, :destroy]
  resources :gym_equipment, only: [:index, :create, :update, :destroy]
  resources :gym_maintenance, only: [:index, :create, :update, :destroy]
  
end
