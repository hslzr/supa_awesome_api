Rails.application.routes.draw do
  devise_for :users
  resources :pages

  # namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
  namespace :api, path: '/api' do
    api_version(:module => "V1", :header => {:name => "Accept",
                                             :value => "application/vnd.awesomeapp.com+json; version=1"},
                                             :defaults => {:format => :json}, :default => true) do


      resources :registrations, only: [:create]
      resources :sessions, only: [:create]
      resources :comments, only: [:create, :index]

      resources :posts

      root 'base#unauthorized'
    end
  end

  root 'pages#index'
end
