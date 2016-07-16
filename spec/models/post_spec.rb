require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { FactoryGirl.build(:post) }
  subject { post }

  context '#validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :body }
  end

  context '#association' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:comments) }
  end

end
