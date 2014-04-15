require 'spec_helper'

describe Api::SurveysController do
  let(:default_params) { { format: :json } }
  before { sign_in_as_user }

  describe '.index' do
    it "returns surveys collection" do
      get :index, default_params
      expect(response).to be_success
    end
  end

  describe '.create' do
    let(:attrs) { attributes_for :new_survey, :with_qualities }
    let(:survey) { assigns(:survey) }
    it "returns new survey" do
      post :create, default_params.merge(survey: attrs)
      expect(response).to be_success
      expect(survey).to be_present
      expect(survey.respondents).to be_present
      expect(survey.personal_quality_list).to be_present
    end
  end

  describe '.show' do
    let(:survey) { create :new_survey, interviewer: current_user }
    let(:ret_survey) { assigns(:survey) }
    it "returns existing survey" do
      get :show, default_params.merge(id: survey)
      expect(response).to be_success
      expect(ret_survey).to be_present
    end
  end

  describe '.update' do
    let(:survey) { create :new_survey, interviewer: current_user }
    let(:attrs) { { id: survey, survey: { title: generate(:string) } } }
    let(:new_survey) { assigns(:survey) }
    it "changes attributes" do
      patch :update, default_params.merge(attrs)
      expect(response).to be_success
      expect(new_survey.title).to eq(attrs[:survey][:title])
    end
  end

  describe '.destroy' do
    let(:survey) { create :survey, interviewer: current_user }
    let(:attrs) { { id: survey } }
    it "deletes survey" do
      delete :destroy, default_params.merge(attrs)
      expect(response).to be_success
      expect(current_user.surveys).not_to include(survey)
    end
  end
end
