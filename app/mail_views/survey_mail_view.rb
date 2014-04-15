class SurveyMailView < ApplicationMailView
  mail :poll_invite do
    interview_form = InterviewForm.last
    generate interview_form
  end
end
