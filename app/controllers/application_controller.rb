class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Concerns::AuthManagement
  include Concerns::Pagination
  helper_method :current_user, :signed_in?
end
