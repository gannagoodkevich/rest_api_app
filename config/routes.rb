Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  post "/graphql", to: "graphql#execute"
  namespace 'api' do
    namespace 'v1' do
      resources :libraries
      resources :authors
      resources :books
    end
  end
end
