class InterviewForm < ActiveRecord::Base
  belongs_to :respondent
  belongs_to :survey
  acts_as_ordered_taggable_on :personal_qualities

  state_machine initial: :initial do
    state :initial
    state :finished

    event :finish do
      transition initial: :finished
    end
  end
  include InterviewForRepository
end
