Rails.application.routes.draw do
  post 'translate', to: 'translations#translate', as: :translate
  get 'messages/index'
  get 'messages/new'
  get 'messages/create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :messages, only: [:new, :create]
  # Define root path
  root 'messages#index'
  # Defines the root path route ("/")
  # root "posts#index"
end
