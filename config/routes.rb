Rails.application.routes.draw do

  # namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
  namespace :api, path: '/api' do
    api_version(:module => "V1", :header => {:name => "Accept",
                                             :value => "application/vnd.awesomeapp.com+json; version=1"},
                                             :defaults => {:format => :json}, :default => true) do

    end
  end

end
