class NewSurveyType < Survey
  include ApplicationType
  attr_accessor :active_template
  permit  :title, :state_event, :permalink,
          :attraction_question, :referention_question, :personal_qualities_question,
          respondents_attributes: [:id, :name, :email, :_destroy]

  def assign_attributes(values = {})
    super(values)
    self.personal_quality_list = deserialized_qualities(values[:personal_qualities] || [])
  end

  protected

  def deserialized_qualities(items = [])
    items.map{|hsh| hsh.fetch(:text)}.compact
  end
end
