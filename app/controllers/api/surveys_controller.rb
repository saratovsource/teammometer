class Api::SurveysController < Api::ApplicationController
  authorize_actions_for Survey

  def index
    @collection = current_user.surveys.ordered.paginate(paginate_params)
    respond_with @collection
  end

  def create
    @survey = NewSurveyType.new
    @survey.interviewer = current_user
    @survey.assign_attributes(params[:survey])
    @survey.save
    respond_with @survey, serializer: SurveySerializer, location: api_surveys_path
  end

  def show
    @survey = Survey.find_by!(permalink: params[:id])
    respond_with @survey, serializer: SurveySerializer
  end

  def update
    @survey = current_user.surveys.find(params[:id]).becomes(NewSurveyType)
    authorize_action_for @survey
    @survey.subscribe(MailNotificationsListener.new)
    @survey.assign_attributes(params[:survey])
    @survey.save
    respond_with @survey, serializer: SurveySerializer, location: api_surveys_path
  end

  def destroy
    @survey = current_user.surveys.find(params[:id])
    authorize_action_for @survey
    @survey.delete
    respond_with @survey, serializer: SurveySerializer
  end
end
