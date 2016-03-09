class WorkoutsPresenter < SimpleDelegator

    attr_reader :service,
                :activitites,
                :stats,
                :running_tip,
                :stat_leader,
                :current_user
                
  def initialize(current_user)
    @current_user = current_user
    super(service)
  end

  def service
    @service ||= ActivityService.new(current_user)
  end

  def activities
    @activity ||= service.list_athlete_activities
  end

  def stats
   @stats ||= UserStatsService.new(current_user)
  end

  def stat_leader
    @stats ||= UserStatistic.order(recent_mileage: :desc)
                            .includes(:user)
                            .first
  end

  def running_tip
    @running_tip ||= RunningTip.offset(tip_count).first
  end

  def tip_count
    rand(RunningTip.count)
  end
end