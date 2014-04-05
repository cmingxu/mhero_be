# -*- encoding : utf-8 -*-
Mhero::Application.routes.draw do

  resource :sessions

  namespace :admin do
    get "/dashboard", to: "base#index"
    get "/", to: "base#index"
    resources :users
    resources :uniq_users
    resources :characters
    resources :worlds
    resources :char_confs
    resources :prop_confs
    resources :char_upgrade_confs
    resources :prop_upgrade_confs
    resources :skill_confs
    resources :moderators do
      get :new_password
      put :change_password
    end
  end

  namespace :api, constraints: { format: 'json' } do
    get "home" => "home#index"
    resources :uniq_users, :only => [:create, :update] do
      collection do
        put :login
      end
    end
    
    resources :worlds, :only => [:index]
  end

  root "admin/base#index"

end
