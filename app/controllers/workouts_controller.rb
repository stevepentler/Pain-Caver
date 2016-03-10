class WorkoutsController < ApplicationController
  before_action :authorize!

  def index
    @presenter = WorkoutsPresenter.new(current_user)
  end

  def show
    @presenter = WorkoutPresenter.new(current_user, params)
  end
end