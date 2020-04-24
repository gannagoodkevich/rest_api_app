Rails.application.routes.draw do
  # devise_for :users

  post "/graphql", to: "graphql#execute"
  namespace 'api' do
    namespace 'v1' do
      resources :libraries
      resources :authors
      resources :books
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    '/auth/facebook/callback' 'devise/sessions#new'
  end
end
