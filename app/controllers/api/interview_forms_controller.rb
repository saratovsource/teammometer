class Api::InterviewFormsController < Api::ApplicationController
  def show
    @interview_form = InterviewForm.initial.where(token: params[:id]).first!
    respond_with @interview_form, serializer: InterviewFormSerializer
  end

  def update
  end
end
