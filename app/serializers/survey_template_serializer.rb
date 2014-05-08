class SurveyTemplateSerializer < ApplicationSerializer
  attributes :id, :title, :personal_qualities, :created_at, :updated_at
  attributes :attraction_question, :referention_question, :personal_qualities_question

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
