Rails.application.routes.draw do
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
  root 'pages#index'
  get 'pages/index'
  get 'pages/profile'
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
