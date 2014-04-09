class SurveyParticipant < ActiveRecord::Base
  belongs_to :survey
  validates :email, :name, presence: true, uniqueness: { scope: :survey_id }
  validates :email, email: true
end
