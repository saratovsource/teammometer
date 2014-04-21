class SurveyReport < DelegateClass(Survey)
  delegate :id, :to => :__getobj__

  def completed_interviews
    interview_forms.finished
  end

  def incompleted_interviews
    interview_forms.initial
  end
end
