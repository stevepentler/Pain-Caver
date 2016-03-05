class DashboardController <ApplicationController
  before_action :authorize!
  
  def show
    @stats = UserStatsService.new(current_user)
    @upcoming_races = current_user.user_races.order(:date)
    tip_count = rand(RunningTip.count)
    @running_tip = RunningTip.offset(tip_count).first
    @trails = TrailService.new(current_user).trails(current_user)
  end
end