require 'rails_helper'

RSpec.describe User, type: :model do   

  describe 'uniqueness' do 
    before(:each) do
      create(:user)
    end

  end


  describe 'encrypts password' do
    it 'does not save password to the db' do
    User.create(username: 'appletarts', password: 'hunter2')
    user = User.find_by(username: 'appletarts')
    expect(user.password).not_to be('hunter2')
  end

    it 'uses BCrypt' do
    expect(BCrypt::Password).to receive(:create)
    User.new(username: 'appletarts', password: 'hunter2')
  end
end
  describe 'session_token_presence' do 
    it 'assigns a session_token if one is not given' do
      user = User.create(username: 'newuser', password: '123456')
      expect(user.session_token).to_not be_nil
    end
  end
  
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should have_many(:comments).class_name(:Comment) }
    it { should have_many(:goals).class_name(:Goal) }

end