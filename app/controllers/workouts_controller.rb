class WorkoutsController < ApplicationController
  def index
    @service = ActivityService.new(current_user)
    @activities = @service.list_athlete_activities
    @stats = UserStatsService.new(current_user)
    tip_count = rand(RunningTip.count)
    @running_tip = RunningTip.offset(tip_count).first
    # @anton = Scrapers::AntonScraper.login_and_scrape
    # binding.pry
  end

  def show
    @race = Race.find_by(title_id: params[:race]) || Race.first
    @service = ActivityService.new(current_user, @race)
    @activity = @service.single_activity(params[:id])
  end
end