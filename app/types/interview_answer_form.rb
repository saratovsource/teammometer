class InterviewAnswerForm < InterviewForm
  include ApplicationType
  permit attraction_users: [:id, :name], referention_users: [:id, :name]

  def assign_attributes(attrs = {}, options = {})
    self.personal_quality_list = attrs.delete(:personal_quality_list)
    super
  end
end
