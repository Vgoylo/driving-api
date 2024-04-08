Rails.application.routes.draw do
  devise_for :teachers
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'home/index'
  # Defines the root path route ("/")

  resources :admins, only: %i[ show_teacher show_user ] do
    get 'show_teacher', on: :collection
    get 'show_user', on: :collection
  end
  # resources :admin, only: %i[teacher]

  namespace :api do
    namespace :v1 do
      resources :admins, only: %i[ index ] do
      end
      
      resources :teachers, only: %i[ index create show ] do
      end

      resources :users, only: %i[ index create show ] do
      end
    end
  end

  root to: 'home#index'
end
