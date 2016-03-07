class WorkoutsPresenter < SimpleDelegator

    attr_reader :service,
                :activitites,
                :stats,
                :running_tip,
                :current_user
                
  def initialize(current_user)
    @current_user = current_user
    @service = ActivityService.new(current_user)
    super(@service)
  end

  def activities
    service.list_athlete_activities
  end

  def stats
    UserStatsService.new(current_user)
  end

  def running_tip
    tip_count = rand(RunningTip.count)
    running_tip = RunningTip.offset(tip_count).first
  end
end