class Web::TemplatesController < ApplicationController
  layout false
  def show
    template_path = File.join('angular_templates', params[:template])
    render template_path
  end
end
