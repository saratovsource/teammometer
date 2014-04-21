class Respondent < ActiveRecord::Base
  belongs_to :survey
  validates :email, :name, presence: true, uniqueness: { scope: :survey_id }, if: -> { new_record? }
  validates :email, email: true
  has_one   :interview_form
  has_many  :attraction_users, through: :interview_form

  after_commit :make_interview_form

  protected

  def make_interview_form
    self.interview_form ||= build_interview_form.tap do |i|
      i.survey = self.survey
      i.token = SecureRandom.urlsafe_base64
    end
    self.interview_form.save
  end
end
