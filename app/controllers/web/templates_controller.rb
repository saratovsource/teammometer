class Web::TemplatesController < ApplicationController
  layout false
  def show
    prepend_view_path "#{ Rails.root }/app/views/angular_templates"
    template_path = File.join('angular_templates', params[:template])
    render template_path
  end
end
