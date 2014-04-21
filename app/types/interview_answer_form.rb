class InterviewAnswerForm < InterviewForm
  include ApplicationType
  permit attraction_users_attributes: [:respondent_id, :position], referention_users_attributes: [:respondent_id, :position]

  def assign_attributes(attrs = {}, options = {})
    self.personal_quality_list = attrs.delete(:personal_quality_list)
    super
  end
end
