class DashboardPresenter < SimpleDelegator

  attr_reader :stats,
              :upcoming_races,
              :running_tip,
              :trail_service,
              :current_user
  
  def initialize(current_user)
    @current_user = current_user
    WorkoutIndexWorker.perform_async(current_user)
  end

  def stats
    stats ||= UserStatsService.new(current_user) 
  end

  def upcoming_races
    current_user.user_races.order(:date)
  end

  def running_tip
    count = rand(RunningTip.count)
    @running_tip = RunningTip.offset(count).first
  end

  def trail_service
    trail_service ||= TrailService.new(current_user)
  end

end