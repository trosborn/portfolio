Portfolio::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :posts, :only => [ :create ]
    end
  end

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
                     controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: "registrations"}


  resources :posts do
    resources :comments
  end

  resources :projects do
    resources :comments
  end

  match '/contacts', to: 'contacts#new', via: 'get'

  resources 'contacts', only: [:new, :create]

  resource :comments

  resources :messages

  get 'welcome/index'

  root 'welcome#index'
end
