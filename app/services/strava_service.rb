class StravaService
  attr_reader :client, 
              :retrieve_current_athlete,
              :list_athlete_activities

  def initialize(current_user)
    @client = Strava::Api::V3::Client.new(:access_token => ENV['MY_ACCESS_TOKEN'])
  end

  def retrieve_current_athlete
    client.retrieve_current_athlete
  end

  def list_athlete_activities
    client.list_athlete_activities
  end

  def total_elevation_gain(activity)
    activity["total_elevation_gain"]
  end

  # def total_elevation_gain
  #   client.list_athlete_activities["total_elevation_gain"]
  # end

end