class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    exception.default_message = "No tiene suficientes privilegios para acceder a este recurso"
    redirect_to root_url, :alert => exception.message
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
