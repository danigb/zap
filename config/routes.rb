Zap::Engine.routes.draw do

  resources :users do
    resources :memberships
    resources :assets
    resources :activities
  end
  resources :spaces do
    resources :memberships
    resources :assets
    resources :activities
  end
  resources :audits
  resources :assets

  match "/auth/:provider/callback" => "sessions#create"
  match "/logout" => "sessions#destroy", :as => :logout
  match "/login" => "sessions#new", :as => :login
  root :to => 'audits#index'
end
