class DashboardController <ApplicationController
  before_action :authorize!
  def show
    binding.pry
    @segment_effort = StravaService.new(current_user)
  end
end