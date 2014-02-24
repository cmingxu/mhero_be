# -*- encoding : utf-8 -*-
Mhero::Application.routes.draw do
  resources :worlds

  get "welcome/index"
  resource :session

  namespace :admin do
    get "/dashboard", to: "base#index"
    get "/", to: "base#index"
    resources :accounts
    resources :moderators do
      get :new_password
      put :change_password
    end
  end

  namespace :api, constraints: { format: 'json' } do
    resources :accounts, :only => [:create, :update] do
      collection do
        put :login
      end
    end
  end

  root "welcome#index"

end
