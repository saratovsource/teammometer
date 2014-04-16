class NewSurveyType < Survey
  include ApplicationType
  permit :title, :state_event, respondents_attributes: [:id, :name, :email, :_destroy]

  def assign_attributes(values = {})
    super(values)
    self.personal_quality_list = deserialized_qualities(values[:personal_qualities] || [])
  end

  protected

  def deserialized_qualities(items = [])
    items.map{|hsh| hsh.fetch(:text)}.compact
  end
end
