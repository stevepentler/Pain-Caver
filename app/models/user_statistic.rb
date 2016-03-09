class UserStatistic < ActiveRecord::Base
  belongs_to :user

  # def self.gather_statistics(current_user)
  #   @stats_service ||= UserStatsService.new(current_user)
  #   user_statistic = find_or_create_by(current_user.id)
  #   create_user_statistic(current_user)
  #   binding.pry
  #   user.save
  # end

  def self.user_statistic_attributes(current_user, service)
    user_statistic = find_or_create_by(user_id: current_user.id)
    
    user_statistic.update_attributes({
    user_id:           current_user.id,
    ytd_mileage:       service.distance("ytd"),
    ytd_sessions:      service.sessions("ytd"),
    ytd_duration:      service.duration("ytd"),
    ytd_elevation:     service.elevation_gain("ytd"),
    recent_mileage:    service.distance("recent"),
    recent_sessions:   service.sessions("recent"),
    recent_duration:   service.duration("recent"),
    recent_elevation:  service.elevation_gain("recent"),
    })
    
    return user_statistic
  end
end
