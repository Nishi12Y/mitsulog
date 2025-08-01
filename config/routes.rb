Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "static_pages#top"

  # login_pathが生成される
  get 'login' , to: 'user_sessions#new'
  post 'login' , to: 'user_sessions#create'
  delete 'logout' , to: 'user_sessions#destroy'

  get 'compliments' , to: 'compliments#index'

  resources :users, only: [:new, :create]
  # resources :diaries, only: [:index, :new, :create]
  resources :good_things do
    collection do
      get :shared
    end
    resources :compliments, only: [:create]
  end
end
