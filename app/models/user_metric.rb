class UserMetric < ActiveRecord::Base
  belongs_to :respondent
  belongs_to :interview_form
end
