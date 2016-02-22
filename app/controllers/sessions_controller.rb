class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by_auth(request.env['omniauth.auth'])
    if user
      binding.pry
      session[:user_id] = user.user_id
      redirect_to dashboard_path
    else
      binding.pry
      redirect_to root_path
    end
  end
end