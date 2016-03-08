class UserStatsService
  include Formatter
  attr_reader :client,
              :current_user

  def initialize(current_user)
    @client = Faraday.new("https://www.strava.com/api/v3") do |faraday|
      faraday.headers = headers(current_user)
      faraday.adapter Faraday.default_adapter
    end
    @current_user = current_user
  end
  
  def sessions(timeframe)
    stats_for(current_user)["#{timeframe}_run_totals"]["count"]
  end

  def distance(timeframe)
    meters = stats_for(current_user)["#{timeframe}_run_totals"]["distance"]
    miles = (meters * meter_to_mile).round(2)
  end

  def duration(timeframe) #recent / ytd
    total_seconds = stats_for(current_user)["#{timeframe}_run_totals"]["moving_time"]
    time_converter(total_seconds)
  end

  def elevation_gain(timeframe)
    meters = stats_for(current_user)["#{timeframe}_run_totals"]["elevation_gain"]
    feet = (meters * meter_to_foot).to_i
  end


  private

  def stats_for(current_user)
    response = client.get("athletes/#{current_user.user_id}/stats", headers(current_user))
    stats = JSON.parse(response.body)
  end

  def headers(current_user)
    {:access_token => "#{current_user.token}"}
  end
end