require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it 'returns a single post' do
      a_post = FactoryGirl.create(:post)
      get :show, id: a_post.id
      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(json_response[:title]).to eq a_post.title
    end
  end

  describe "GET #create" do

    context 'with valid params' do
      
    end

    context 'with invalid params' do
      
    end

  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
