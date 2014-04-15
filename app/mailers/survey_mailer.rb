class SurveyMailer < ApplicationMailer
  def poll_invite(interview_form)
    @user = interview_form.respondent
    @survey = interview_form.survey
    @interview = interview_form
    mail(to: @user.email)
  end
end
