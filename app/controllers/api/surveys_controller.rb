class Api::SurveysController < Api::ApplicationController

  def index
    @collection = current_user.surveys
    respond_with @collection
  end

  def create
    @survey = NewSurveyType.new(params[:survey])
    @survey.interviewer = current_user
    @survey.save
    respond_with @survey, serializer: SurveySerializer
  end

  def update
    @survey = current_user.surveys.find(params[:id]).becomes(NewSurveyType)
    @survey.assign_attributes(params[:survey])
    @survey.save
    respond_with @survey, serializer: SurveySerializer
  end

  def destroy
    @survey = current_user.surveys.find(params[:id])
    @survey.delete
    respond_with @survey, serializer: SurveySerializer
  end
end
