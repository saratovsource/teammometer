class SurveyMailView < ApplicationMailView
  mail :poll_invite do
    interview_form = InterviewForm.initial.last
    generate interview_form
  end
end
