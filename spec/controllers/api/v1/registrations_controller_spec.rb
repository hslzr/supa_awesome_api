require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, :type => :controller do
  let(:registration_params) do
    FactoryGirl.attributes_for(:user)
  end

  describe "POST create" do
    it "returns http success" do
      post :create, user: registration_params
      expect(response).to have_http_status(:success)
    end
  end

  context 'Signup user' do
    let(:user_params) do
      FactoryGirl.attributes_for(:user)
    end

    it 'return email and token' do
      post :create, user: user_params
      expect(json_response[:user]).to_not eq(nil)
      expect(json_response[:user][:email]).to eq(user_params[:email])
      expect(json_response[:user][:token]).to_not eq(nil)
    end

  end

end
