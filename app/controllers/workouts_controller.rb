class WorkoutsController < ApplicationController
  def index
    @service = ActivityService.new(current_user)
    @activities = @service.list_athlete_activities
  end

  def show
    @race = Race.find_by(title_id: params[:race]) || Race.first
    @service = ActivityService.new(current_user, @race)
    @activity = @service.single_activity(params[:id])
  end
end