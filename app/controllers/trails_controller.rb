class TrailsController < ApplicationController 
  def index
    @trails = TrailService.new(current_user).trails(current_user)
  end

  def show
    # @trail = Trail
  end
end