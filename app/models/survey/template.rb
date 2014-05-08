class Survey::Template < ActiveRecord::Base
  acts_as_taggable_on :personal_qualities
  belongs_to :user

  class << self
    def default
      attrs = [ :attraction_question,
        :referention_question,
        :personal_qualities_question,
        :personal_quality_list ].inject({}) do |h, i|
          h.merge(i.to_sym => I18n.t("questions.#{i}"))
          end
      new(attrs)
    end
  end

end
