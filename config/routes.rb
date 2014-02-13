Mhero::Application.routes.draw do
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

  namespace :api do
    resources :account, :only => [:create, :update]
  end

  root "welcome#index"

end
