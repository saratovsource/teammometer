require 'spec_helper'

describe Api::InterviewFormsController do
  let(:default_params) { { format: :json } }

  describe ".show" do
    let( :interview_form ) { create :interview_form }
    it "returns interview form" do
      get :show, default_params.merge( id: interview_form.token )
      expect( response ).to be_success
      interview = assigns( :interview_form )
      expect( interview ).to eq( interview_form )
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      pending
    end
  end

end
