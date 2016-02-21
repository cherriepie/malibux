class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_filter :authenticate
  
  before_action :authenticate_user!

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  layout :layout_by_resource

  protected

  def layout_by_resource
    if user_signed_in?
      "dashboard_layout"
    else
      "application"
    end
  end
  
  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "squeeze"
    end
  end

end
