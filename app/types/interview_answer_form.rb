class InterviewAnswerForm < InterviewForm
  include ApplicationType
  permit :attraction_users, :referention_users

  def assign_attributes(attrs = {}, options = {})
    self.personal_quality_list = attrs.delete(:personal_quality_list)
    super
  end
end
