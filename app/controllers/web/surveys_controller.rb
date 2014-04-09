class Web::SurveysController < ApplicationController
  def index
    @collection = current_user.surveys
  end
end
