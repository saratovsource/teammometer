require 'spec_helper'

describe Web::SurveysController do
  describe ".index" do
    before { sign_in_as_user }
    it "shown user surveys" do
      get :index
      expect(response).to be_success
      surveys = assigns(:collection)
    end
  end
end
