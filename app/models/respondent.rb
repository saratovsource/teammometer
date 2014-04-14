class Respondent < ActiveRecord::Base
  belongs_to :survey
  validates :email, :name, presence: true, uniqueness: { scope: :survey_id }, if: -> { new_record? }
  validates :email, email: true
end
