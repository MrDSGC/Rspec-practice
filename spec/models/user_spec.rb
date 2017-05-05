require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do

    let (:user) { FactoryGirl.create(:user)}
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:session_token)}
    it { should validate_presence_of(:password_digest)}
    it { should validate_uniqueness_of(:username)}
  end

  describe 'associations' do
    it { should have_many(:favorites)}
    it { should have_many(:favorite_benches)}
  end

  describe 'instance_methods' do
    describe '#reset_session_token!' do
      let (:user) { FactoryGirl.create(:user)}
      it 'resets the session token' do
        # test goes here
        old_session_token = user.session_token
        user.reset_session_token!
        expect(user.session_token).not_to eql(old_session_token)
      end
    end
  end

  describe 'model_methods' do
    describe '.find_by_credentials' do
      context 'when given correct credentials' do
        let!(:user) { FactoryGirl.create(:user)}
        it 'should find the right user' do
          found = User.find_by_credentials('Donnie', 'password')
          expect(found).to eql(user)
        end
      end

      context 'when given incorrect credentials' do
        it 'should return nil' do
          found = User.find_by_credentials("hi", 'asdf')
          expect(found).to eql(nil)
        end
      end
    end
  end

end
