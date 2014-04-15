class SurveySerializer < ApplicationSerializer
  attributes :id, :title, :created_at, :updated_at, :respondents, :personal_qualities

  def created_at
    I18n.l(object.created_at, format: :short)
  end

  def updated_at
    I18n.l(object.updated_at, format: :short)
  end

  def personal_qualities
    object.personal_quality_list.map{|i| {text: i}}
  end
end
