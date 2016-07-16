require 'rails_helper'

RSpec.describe Api::V1::SessionsController, :type => :controller do

  describe "POST create" do
    user = FactoryGirl.create(:user)
    it "returns http success" do
      post :create, user: { email: user.email, password: 'changeme' }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Signup user' do
    it 'return email and token' do
      user = FactoryGirl.create(:user)
      post :create, user: { email: user.email, password: 'changeme' }
      puts json_response.inspect
      expect(json_response[:user]).to_not eq(nil)
      expect(json_response[:user][:email]).to eq(user.email)
      expect(json_response[:user][:token]).to_not eq(nil)
    end

  end


end
