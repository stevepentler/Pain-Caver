class DashboardController <ApplicationController
  before_action :authorize!
  
  def show
    @presenter = DashboardPresenter.new(current_user)
  end
end