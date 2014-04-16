class InterviewForm < ActiveRecord::Base
  belongs_to :respondent
  belongs_to :survey
  acts_as_ordered_taggable_on :personal_qualities

  state_machine initial: :new do
    state :new
    state :active
    state :finished

    event :start do
      transition new: :active
    end

    event :finish do
      transition active: :finished
    end
  end

end
