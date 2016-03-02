class WorkoutsController < ApplicationController
  def index
    @activities = ActivityService.new(current_user)
  end

  def show
    @race = Race.find_by(title_id: params[:race]) || Race.first
    @service = ActivityService.new(current_user, @race)
    @activity = @service.single_activity(params[:id])
  end
end