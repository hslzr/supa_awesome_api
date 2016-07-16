require 'rails_helper'

RSpec.describe Api::V1::CommentsController, type: :controller do
  describe "GET #index" do
    it "returns 4 records from the database in json" do
      4.times { FactoryGirl.create :comment }
      get :index
      expect(json_response[:comments].count).to be 4
    end
  end

#   describe "POST #create" do
#    it "it return the record that we created" do
#      comment_params = { user_id: 1, post_id: 2, body: "kiubole" } 
#      post :create, { comment: comment_params }
#      expect(json_response[:comment][:body]).to eql "kiubole"
#    end
#  end
end
