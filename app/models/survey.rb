class Survey < ActiveRecord::Base
  include Wisper::Publisher

  validates   :title, presence: true
  belongs_to  :interviewer, class_name: "User"
  has_many    :respondents, dependent: :destroy
  has_many    :interview_forms
  acts_as_taggable_on :personal_qualities
  before_create :generate_permalink

  accepts_nested_attributes_for :respondents, allow_destroy: true

  state_machine initial: :initial do
    state :initial
    state :started
    state :finished

    after_transition initial: :started,  do: :start_the_survey

    event :start do
      transition initial: :started
    end

    event :finish do
      transition started: :finished
    end

    event :resume do
      transition finished: :started
    end

  end
  include ServeyRepository

  protected

  def start_the_survey
    publish(:start_the_survey, self)
  end

  def generate_permalink
    permalink = SecureRandom.urlsafe_base64(32)
  end

end
