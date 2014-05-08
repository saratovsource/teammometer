require 'spec_helper'

describe Api::TemplatesController do
  let(:default_params) { { format: :json } }
  before { sign_in_as_user }

  describe '.index' do
    it "returns templates collection" do
      get :index, default_params
      expect(response).to be_success
    end
  end

  describe '.create' do
    let(:attrs) { attributes_for :survey_template }
    let(:template) { assigns(:survey_template) }
    it "returns new template" do
      post :create, default_params.merge( survey_template: attrs )
      expect(response).to be_success
      expect(template).to be_present
    end
  end

  describe '.show' do
    let(:template) { create :survey_template, user: current_user }
    let(:new_template) { assigns :survey_template }
    let(:attrs) { { id: template } }
    it "retrive template for survey" do
      get :show, default_params.merge(attrs)
      expect(response).to be_success
      expect(:new_template).to be_present
    end
  end

  describe '.update' do
    let(:template) { create :survey_template, user: current_user }
    let(:new_template) { assigns :survey_template }
    let(:attrs) { { id: template, survey_template: { title: generate(:string) } } }
    it "update template attributes" do
      patch :update, default_params.merge(attrs)
      expect(response).to be_success
      expect(new_template.title).to eq(attrs[:survey_template][:title])
    end
  end

  describe '.destroy' do
    let(:template) { create :survey_template, user: current_user }
    let(:attrs) { { id: template } }
    it "delete template" do
      delete :destroy, default_params.merge(attrs)
      expect(response).to be_success
      expect(current_user.survey_templates).not_to include(template)
    end
  end
end
