module Interview
  class SurveySerializer < ApplicationSerializer
    attributes :title
    has_many :personal_qualities
    has_many :respondents, serializer: Interview::RespondentSerializer
  end
end
