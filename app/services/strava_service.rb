class StravaService
  attr_reader :client, 
              :retrieve_current_athlete,
              :list_athlete_activities

  def initialize(current_user)
    @client = Strava::Api::V3::Client.new(:access_token => ENV['MY_ACCESS_TOKEN'])
  end

  def list_athlete_activities
    client.list_athlete_activities
  end

  def total_elevation_gain(activity)
    activity["total_elevation_gain"]
  end

  def name(activity)
    activity["name"]
  end

  def distance(activity)
    activity["distance"]
  end

  def duration(activity)
    activity["time"]
  end

  def elev_high(activity)
    activity["elev_high"]
  end

  def elev_low(activity)
    activity["elevation_low"]
  end

  def type(activity)
    activity["type"]
  end

  def start_date(activity)
    activity["start_date"]
  end  

  def average_speed(activity)
    activity["average_speed"]
  end  

  def max_speed(activity)
    activity["max_speed"]
  end  

  def calories(activity)
    activity["calories"]
  end

end