class InterviewForm < ActiveRecord::Base
  belongs_to :respondent
  belongs_to :survey

  has_many :attraction_users, ->{ order(position: :desc) }
  has_many :referention_users, ->{ order(position: :desc) }

  acts_as_ordered_taggable_on :personal_qualities

  accepts_nested_attributes_for :attraction_users
  accepts_nested_attributes_for :referention_users

  state_machine initial: :initial do
    state :initial
    state :finished

    event :finish do
      transition initial: :finished
    end
  end
  include InterviewForRepository
end
