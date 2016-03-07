class WorkoutsController < ApplicationController
  before_action :authorize!

  def index
    @presenter = WorkoutsPresenter.new(current_user)
    # @service = ActivityService.new(current_user)
    # @activities = @service.list_athlete_activities
    # @stats = UserStatsService.new(current_user)
    # tip_count = rand(RunningTip.count)
    # @running_tip = RunningTip.offset(tip_count).first
  end

  def show
    @race = Race.find_by(title_id: params[:race]) || Race.first
    @service = ActivityService.new(current_user, @race)
    @activity = @service.single_activity(params[:id])
  end
end