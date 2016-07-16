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
  describe "PUT #update" do
    context 'with valid params' do
      it "returns post recently created" do
        a_post = FactoryGirl.create :post
        post_params = { title: "First Post" , body: " Lorem Ipsum "}
        put :update , { post: post_params , id: a_post.id}
        json_response = JSON.parse(response.body, symbolize_names: true)
        expect(json_response[:title]).to eq "First Post"
      end
    end

    context 'with invalid params' do
      it "returns object with errors" do
        a_post = FactoryGirl.create :post
        post_params = { title: nil }
        put :update , { post: post_params , id: a_post.id }
        json_response = JSON.parse(response.body, symbolize_names: true)
        expect(json_response[:post]).to have_key(:errors)
      end
    end
  end
  describe "POST #create" do

    context 'with valid params' do
      it "returns post recently created" do
        post_params = { title: "First Post" , body: " Lorem Ipsum "}
        post :create , { post: post_params }
        json_response = JSON.parse(response.body, symbolize_names: true)
        expect(json_response[:title]).to eq "First Post"
      end
    end

    context 'with invalid params' do
      it "returns object with errors" do
        post_params = { title: "Post title" }
        post :create , { post: post_params}
        json_response = JSON.parse(response.body, symbolize_names: true)
        expect(json_response[:post]).to have_key(:errors)
      end
    end

  end

  describe "DELETE #destroy" do
    it "returns content with no header" do
      a_post = FactoryGirl.create(:post)
      delete :destroy , id: a_post.id
      expect(response).to have_http_status(204)
    end
  end

end
