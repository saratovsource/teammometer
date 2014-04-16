class MailNotificationsListener
  def start_the_survey(survey)
    survey.interview_forms.each do |form|
      SurveyMailer.poll_invite(form).deliver
    end
  end
end
