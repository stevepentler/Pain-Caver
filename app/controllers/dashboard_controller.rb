class DashboardController <ApplicationController
  before_action :authorize!
  
  def show
    @stats = UserStatsService.new(current_user)
  end
end