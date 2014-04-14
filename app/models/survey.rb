class Survey < ActiveRecord::Base
  validates   :title, presence: true
  belongs_to  :interviewer, class_name: "User"
  has_many    :respondents, dependent: :destroy

  accepts_nested_attributes_for :respondents, allow_destroy: true

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
