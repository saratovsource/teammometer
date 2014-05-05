class SurveySerializer < ApplicationSerializer
  attributes :id, :title, :state, :created_at, :updated_at, :respondents, :personal_qualities
  attributes :attraction_question, :referention_question, :personal_qualities_question
  attributes :interviews, :permalink

  def created_at
    I18n.l(object.created_at, format: :short)
  end

  def updated_at
    I18n.l(object.updated_at, format: :short)
  end

  def personal_qualities
    object.personal_quality_list.map{|i| {text: i}}
  end

  def interviews
    {
      all: object.interview_forms.count,
      completed: object.interview_forms.finished.count
    }
  end
end
