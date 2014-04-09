class NewSurveyType < Survey
  include ApplicationType
  permit :title
end
