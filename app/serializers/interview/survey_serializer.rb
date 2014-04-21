module Interview
  class SurveySerializer < ApplicationSerializer
    attributes :title
    attributes :attraction_question, :referention_question, :personal_qualities_question
    has_many :personal_qualities
    has_many :respondents, serializer: Interview::RespondentSerializer

    [:attraction_question, :referention_question, :personal_qualities_question].each do |mth|
      define_method mth do
        object.send(mth).presence || I18n.t("questions.#{mth}")
      end
    end

  end
end
