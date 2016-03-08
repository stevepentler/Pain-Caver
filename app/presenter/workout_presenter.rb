class WorkoutPresenter < SimpleDelegator

    attr_reader :service,
                :activity,
                :race,
                :current_user,
                :params
                
  def initialize(current_user, params={race: "leadville"})
    @current_user = current_user
    @params = params
    super(service)
  end

  def service
    @service ||= ActivityService.new(current_user, race)
  end

  def activity
    @activity ||= @service.single_activity(params[ :id])
  end

  def race
    @race ||= Race.find_by(title_id: params[:race]) || Race.first
  end

end