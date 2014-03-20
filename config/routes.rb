# -*- encoding : utf-8 -*-
Mhero::Application.routes.draw do

  resource :sessions

  namespace :admin do
    get "/dashboard", to: "base#index"
    get "/", to: "base#index"
    resources :users
    resources :uniq_users
    resources :worlds
    resources :moderators do
      get :new_password
      put :change_password
    end
  end

  namespace :api, constraints: { format: 'json' } do
    get "home" => "api/home#index"
    resources :uniq_users, :only => [:create, :update] do
      collection do
        put :login
      end
    end
    
    resources :worlds, :only => [:index]
  end

  root "welcome#index"

end
