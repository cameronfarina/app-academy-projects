require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do 
    it 'renders a new user' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
        it "redirects to goal index page" do
            expect(repsonse).to redirect_to(goals_url)
        end

        it 'logs the user in' do 
            post :create, params: { user: { username: 'himbleflobbits', password: 'password'} }
            user = User.find_by(username: 'himbleflobbits')

            expect(session[:session_token]).to eq(user.session_token)
        end
    end

    context 'with invalid params' do
        it "validates presence of username and password " do
            post :create, params: { user: { username: 'himblobbits', password: ''} }
            expect(response).to render_template(:new)
            expect(flash[:errors]).to be_present
        end

        it "validates password is at least 6 characters long " do
            post :create, params: { user: { username: 'himblobbits', password: 'whats'} }
            expect(response).to render_template(:new)
            expect(flash[:errors]).to be_present
        end
    end
  end
end
