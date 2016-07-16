require 'rails_helper'

RSpec.describe Post, type: :model do

  describe '#validations' do
    let(:post) { FactoryGirl.build(:post) }
    subject { post }
    
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :body }
  end

  describe '#association' do
    let(:post) { FactoryGirl.build(:post) }
    subject { post }

    it { is_expected.to belong_to(:user) }
  end

end
