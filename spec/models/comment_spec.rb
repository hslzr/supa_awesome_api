require 'rails_helper'

RSpec.describe Comment, :type => :model do
  let(:comment) { FactoryGirl.create :comment }
    subject { comment }

    describe '#validations' do
      it { should be_valid }
    end

    describe "#associations" do
      it { should belong_to(:user) }
      it { should belong_to(:post) }
    end
end