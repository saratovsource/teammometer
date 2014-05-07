class SurveyTemplateType < Survey::Template
  include ApplicationType
  permit :title, :attraction_question, :referention_question, :personal_qualities_question

  def assign_attributes(values = {})
    super(values)
    self.personal_quality_list = deserialized_qualities(values[:personal_qualities] || [])
  end

  protected

  def deserialized_qualities(items = [])
    items.map{|hsh| hsh.fetch(:text)}.compact
  end
end
