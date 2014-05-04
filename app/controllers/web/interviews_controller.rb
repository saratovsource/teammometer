class Web::InterviewsController < Web::ApplicationController
  layout "promo"
  def show
    @interview = InterviewForm.in_active_survey.active(params[:id]).first!
  end
end
