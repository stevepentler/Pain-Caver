class DashboardController <ApplicationController
  before_action :authorize!
  
  def show
    # @activities = StravaService.new(current_user)
    @stats = UserStatsService.new(current_user)
  end
end