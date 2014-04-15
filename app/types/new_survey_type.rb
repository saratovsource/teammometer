class NewSurveyType < Survey
  include ApplicationType
  permit :title, respondents_attributes: [:id, :name, :email, :_destroy]

  def assign_attributes(values = {})
    super(values)
    self.personal_quality_list = values[:personal_quality_list]
  end
end
