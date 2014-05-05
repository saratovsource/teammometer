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
      expect(survey.permalink).to be_present
    end
  end

  describe '.show' do
    let(:survey) { create :new_survey, interviewer: current_user }
    let(:ret_survey) { assigns(:survey) }
    it "returns existing survey" do
      get :show, default_params.merge(id: survey.permalink)
      expect(response).to be_success
      expect(ret_survey).to be_present
    end
  end

  describe '.update' do
    let(:survey) { create :new_survey, interviewer: current_user }
    let(:new_survey) { assigns(:survey) }
    context "update attributes" do
      let(:attrs) { { id: survey, survey: { title: generate(:string) } } }
      it "changes attributes" do
        patch :update, default_params.merge(attrs)
        expect(response).to be_success
        expect(new_survey.title).to eq(attrs[:survey][:title])
      end
    end

    context "start project" do
      let(:attrs) { { id: survey, survey: { state_event: "start" } } }
      it "shange state to " do
        patch :update, default_params.merge(attrs)
        expect(response).to be_success
        expect(new_survey).to be_started
      end
    end

    context "finish project" do
      let(:survey) { create :new_survey, interviewer: current_user, state: "started" }
      let(:attrs) { { id: survey, survey: { state_event: "finish" } } }
      it "shange state to " do
        patch :update, default_params.merge(attrs)
        expect(response).to be_success
        expect(new_survey).to be_finished
      end
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
