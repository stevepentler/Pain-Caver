# class WorkoutIndexWorker
#   include Sidekiq::Worker 
  
#   def perform(current_user)
#     @presenter = WorkoutsPresenter.new(current_user)
#     @presenter.service
#     @presenter.activities
#     @presenter.stats
#     @presenter.running_tip
#     binding.pry
#   end
# end