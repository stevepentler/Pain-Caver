class WorkoutsController < ApplicationController
  def index
    @activities = ActivityService.new(current_user)
  end

  def show
    @service = ActivityService.new(current_user)
    @activity = @service.single_activity(params[:id])
  end
end