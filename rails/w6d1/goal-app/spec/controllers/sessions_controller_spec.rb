require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:user) { User.create({ username: 'camkesh', password: '123456' }) }
   
    describe 'GET #new' do 
      it 'renders a new session' do
        get :new
        expect(response).to render_template(:new)
      end
    end

  describe 'POST #create' do

    context 'with invalid credentials' do
      it "returns to sign in with non-existent user" do
        post :create, params: { user: { username: 'notcamkesh', password: '123456'} }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end

      it "returns to sign in page on bad password" do
        post :create, params: { user: { username: 'camkesh', password: 'incorrectpass'} }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end

    context 'with valid credentials' do
      it "redirects to goal index page" do
        post :create, params: { user: { username: 'camkesh', password: '123456'} }
        expect(response).to redirect_to(goals_url)
      end

      it 'logs the user in' do 
        post :create, params: { user: { username: 'camkesh', password: '123456'} }
        user = User.find_by(username: 'camkesh')
        expect(session[:session_token]).to eq(user.session_token)
      end
    end

    describe 'DELETE #destroy' do
      before(:each) do 
        post :create, params: { user: { username: 'camkesh', password: '123456'} }
      end

      it 'logs out of the current user' do
        delete :destroy
        expect(session[:session_token]).to be_nil
      end

      it 'ensures users session token has been reset' do
        user = User.find_by(username: 'camkesh')
        expect(user.session_token).not_to eq(@session_token)
      end
    end
end
