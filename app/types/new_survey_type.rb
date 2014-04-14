class NewSurveyType < Survey
  include ApplicationType
  permit :title, respondents_attributes: [:id, :name, :email, :_destroy]
end
