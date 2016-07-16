require 'rails_helper'

RSpec.describe User, :type => :model do
  let (:user) { FactoryGirl.build :user }
  subject { user }

  describe '#validations' do
    it { should be_valid }
  end

  describe '#associations' do
  end

  describe 'On save' do
    user = FactoryGirl.create :user

    it '.token is not nil' do
      expect(user.token).to_not eq(nil)
    end
  end


end
