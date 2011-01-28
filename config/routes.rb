Zap::Engine.routes.draw do

  resources :users do
    resources :permissions
    resources :assets
    resources :activities
    resources :comments
    resources :properties
    resources :tags
  end
  resources :spaces do
    resources :permissions
    resources :assets
    resources :activities
    resources :comments
    resources :properties
    resources :tags
  end
  resources :audits
  resources :assets

  match "/auth/:provider/callback" => "sessions#create"
  match "/logout" => "sessions#destroy", :as => :logout
  match "/login" => "sessions#new", :as => :login
  root :to => 'audits#index'
end
