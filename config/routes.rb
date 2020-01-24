Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  namespace 'api' do
    namespace 'v1' do
      resources :authors do
        resources :books
      end
    end
  end
end
