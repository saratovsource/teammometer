class Api::InterviewFormsController < Api::ApplicationController
  def show
    @interview_form = InterviewForm.initial.where(token: params[:id]).first!
    respond_with @interview_form, serializer: InterviewFormSerializer
  end

  def update
    answer = params.fetch(:interview_form, {})[:answer]
    @answer_form = InterviewAnswerForm.find(params[:interview_form][:id])
    @answer_form.assign_attributes(answer)
    @answer_form.finish
    respond_with @answer_form
  end
end
