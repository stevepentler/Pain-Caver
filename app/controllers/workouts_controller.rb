class WorkoutsController < ApplicationController
  def index
    @activities = StravaService.new(current_user)
  end

  def show
  end
end