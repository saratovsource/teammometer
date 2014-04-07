require 'spec_helper'

describe Web::WelcomeController do

  describe '.index' do
    context "as guest user" do
      it "get index" do
        get :index
        expect(response).to be_success
        user = assigns(:current_user)
        expect(controller.signed_in?).to be false
      end
    end

    context "as authenticated user" do
      before { sign_in_as_user }
      it "get index" do
        get :index
        expect(response).to be_success
        user = assigns(:current_user)
        expect(controller.signed_in?).to be true
      end
    end
  end
end
