class WorkoutIndexWorker
  include Sidekiq::Worker 
  
  def perform(current_user)
    @presenter = Presenter::WorkoutsPresenter.new(current_user)
    # @presenter.service
    @presenter.activities
    # @presenter.stats
    # @presenter.running_tip
  end
end