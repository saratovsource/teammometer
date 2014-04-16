class Web::InterviewsController < Web::ApplicationController
  layout "promo"
  def show
    @interview = InterviewForm.active(params[:id]).first!
  end
end
