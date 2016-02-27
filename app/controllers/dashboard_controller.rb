class DashboardController <ApplicationController
  before_action :authorize!
  
  def show
    @athlete = StravaService.new(current_user).retrieve_current_athlete
    @activities = StravaService.new(current_user)
  end
end