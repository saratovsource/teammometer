class InterviewFormSerializer < ApplicationSerializer
  attributes :token, :id
  has_one :respondent, serializer: Interview::RespondentSerializer
  has_one :survey, serializer: Interview::SurveySerializer
end
