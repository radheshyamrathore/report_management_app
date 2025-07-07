# config/routes.rb
require 'sidekiq/web'

Rails.application.routes.draw do
    mount Sidekiq::Web => '/sidekiq'
    
  devise_for :users
  root 'home#index'
  
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  
  resources :reports do
    member do
      patch :publish
    end
  end
  
  # Admin routes
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end
end
