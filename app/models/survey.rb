class Survey < ActiveRecord::Base
  validates   :title, presence: true
  belongs_to  :interviewer, class_name: "User"
  has_many    :survey_participants

  state_machine initial: :disabled do
    state :enabled
    state :disabled

    event :enable do
      transition disabled: :enabled
    end

    event :disable do
      transition enabled: :disabled
    end
  end
  include ServeyRepository
end
