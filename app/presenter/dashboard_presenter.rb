class DashboardPresenter < SimpleDelegator

  attr_reader :stats,
              :upcoming_races,
              :running_tip,
              :trail_service,
              :stat_leaders,
              :current_user
  
  def initialize(current_user)
    @current_user = current_user
  end

  def stats
    stats ||= UserStatsService.new(current_user)
    Rails.cache.fetch("distance-#{current_user.id}-#{stats.distance("ytd")}") do  
      stats.create_user_statistics(current_user, stats)
    end
    return stats
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

  def stat_leaders
    @stat_leaders ||= UserStatistic.order(ytd_mileage: :desc)
                                   .includes(:user)
                                   .first(3)                     
  end

end