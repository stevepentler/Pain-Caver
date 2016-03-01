class WorkoutsController < ApplicationController
  def index
    @activities = ActivityService.new(current_user)
  end

  def show
    @activities = ActivityService.new(current_user)
  end
end