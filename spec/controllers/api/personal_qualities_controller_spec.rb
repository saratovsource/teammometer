require 'spec_helper'

describe Api::PersonalQualitiesController do
  let(:default_params) { { format: :json } }
  before { sign_in_as_user }

  describe '.index' do
    it "returns tags collecton" do
      get :index, default_params.merge(query: "*")
      expect( response ).to be_success
    end
  end

end
