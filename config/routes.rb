Rails.application.routes.draw do
  get "cities/index"
  get "cities/show"
  get "pages/about"
  get "countries/index"
  get "countries/show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get 'about', to: 'pages#about'
  resources :countries, only: [:index, :show]
  resources :cities, only: [:index, :show]
  resources :weather_reports, only: [:index, :show]

  # Defines the root path route ("/")
  # root "posts#index"
  root 'pages#home'
end
