require 'spec_helper'

describe Web::UsersController do

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    let(:user_params) { attributes_for(:user) }
    it "returns http redirect" do
      post :create, user: user_params
      expect(response).to be_redirect
      user = assigns(:user)
      expect(user.confirmation_token).to be_present
    end
  end

  describe "GET 'confirm'" do
    let(:requested_user)     { create :requested_user }
    let(:confirmation_token) { requested_user.confirmation_token }
    it "returns http redirect" do
      get 'confirm', id: confirmation_token
      expect(response).to be_redirect
      expect(current_user).to eq(requested_user)
      expect(current_user.confirmation_token).to be_blank
    end
  end

end
