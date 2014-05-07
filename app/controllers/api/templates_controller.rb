class Api::TemplatesController < Api::ApplicationController

  def index
    @collection = current_user.survey_templates.paginate(paginate_params)
    respond_with @collection
  end

  def create
    @survey_template = SurveyTemplateType.new(params[:survey_template])
    @survey_template.user = current_user
    @survey_template.save
    respond_with @survey_template, location: api_templates_path
  end

  def show
    @survey_template = current_user.survey_templates.find(params[:id])
    respond_with @survey_template
  end

  def update
    @survey_template = current_user.survey_templates.find(params[:id]).becomes(SurveyTemplateType)
    @survey_template.assign_attributes(params[:survey_template])
    @survey_template.save
    respond_with @survey_template, location: api_templates_path
  end

  def destroy
    @survey_template = current_user.survey_templates.find(params[:id])
    @survey_template.delete
    respond_with @survey_template
  end
end
