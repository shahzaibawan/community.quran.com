Rails.application.routes.draw do

  root to: "questions#index"
  
  resources :tags, only: [:index]
  resources :questions, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :categories, only: [:index]


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
