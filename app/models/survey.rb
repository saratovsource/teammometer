class Survey < ActiveRecord::Base
  include Wisper::Publisher

  validates   :title, presence: true
  belongs_to  :interviewer, class_name: "User"
  has_many    :respondents, dependent: :destroy
  has_many    :interview_forms
  acts_as_taggable_on :personal_qualities

  accepts_nested_attributes_for :respondents, allow_destroy: true

  state_machine initial: :disabled do
    state :enabled
    state :disabled

    after_transition disabled: :enabled, do: :start_the_survey

    event :enable do
      transition disabled: :enabled
    end

    event :disable do
      transition enabled: :disabled
    end

  end
  include ServeyRepository

  protected

  def start_the_survey
    publish(:start_the_survey, self)
  end

end
