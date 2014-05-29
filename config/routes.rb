Portfolio::Application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
                     controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :posts do
    resources :comments
  end

  resources :projects do
    resources :comments
  end

  resource :comments

  get 'welcome/index'

  root 'welcome#index'
end
