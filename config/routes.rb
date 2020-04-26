Rails.application.routes.draw do
  # devise_for :users

  post "/graphql", to: "graphql#execute"
  namespace 'api' do
    namespace 'v1' do

      #mount_devise_token_auth_for 'User', at: 'auth'

      resources :libraries
      resources :authors
      resources :books
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  delete 'not_devise/users/sign_out', to: 'authentications#destroy'
end
