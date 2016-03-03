class DashboardController <ApplicationController
  before_action :authorize!
  
  def show
    @stats = UserStatsService.new(current_user)
    @upcoming_races = current_user.user_races.order(:date)
  end
end