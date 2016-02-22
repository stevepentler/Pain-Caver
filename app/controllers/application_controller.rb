class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user, :authorize!

  def current_user
    @current_user ||= User.find_by(user_id: session[:user_id]) if session[:user_id]
  end

  def authorize!
    redirect_to root_path, notice: "Please login to access your data" unless current_user
  end
end
