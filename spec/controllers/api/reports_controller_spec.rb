require 'spec_helper'

describe Api::ReportsController do
  let(:default_params) { { format: :json } }
  let(:survey) { create :completed_survey, interviewer: current_user }
  before { sign_in_as_user }

  describe ".show" do
    it "returns reports for survey" do
      get :show, default_params.merge(survey_id: survey)
      expect( response ).to be_success
    end
  end

end
