class Api::ReportsController < Api::ApplicationController
  def show
    @report = current_survey.becomes(SurveyReport)
    respond_with @report, serializer: SurveyReportSerializer
  end

  private

  def current_survey
    @current_survey ||= current_user.surveys.find(params[:survey_id])
  end
end
