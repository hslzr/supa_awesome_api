require 'rails_helper'

RSpec.describe "Base api url request", :type => :request do
  describe "GET /api" do
    it 'Should redirect me to the root url' do
      get api_root_path
      expect(response).to redirect_to root_path
    end
  end
end