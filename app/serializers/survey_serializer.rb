class SurveySerializer < ApplicationSerializer
  attributes :id, :title, :created_at, :updated_at, :respondents

  def created_at
    I18n.l(object.created_at, format: :short)
  end

  def updated_at
    I18n.l(object.updated_at, format: :short)
  end
end
