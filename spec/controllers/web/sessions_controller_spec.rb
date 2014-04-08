require 'spec_helper'

describe Web::SessionsController do
  describe '.create' do
    let(:password) { generate :string }
    let(:user) { create :authenticated_user, password: password, password_confirmation: password }
    let(:attrs) { { email: user.email, password: password } }
    it "successfull login" do
      post :create, session_type: attrs
      expect(response).to be_redirect
      expect(signed_in?).to be true
    end
  end

  describe '.delete' do
    let(:user) { create :authenticated_user }
    before { sign_in user }
    it "logout user" do
      delete :destroy
      expect(response).to be_redirect
      expect(signed_in?).to be false
    end
  end
end
