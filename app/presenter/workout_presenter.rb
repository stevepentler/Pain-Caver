class WorkoutPresenter < SimpleDelegator

    attr_reader :service,
                :activitity,
                :race,
                :current_user,
                :params
                
  def initialize(current_user, params)
    @current_user = current_user
    @params = params
    @service = ActivityService.new(current_user, race)
    super(@service)
  end

  def activity
    service.single_activity(params[:id])
  end

  def race
    Race.find_by(title_id: params[:race]) || Race.first
  end

end