class StravaService
  attr_reader :client

  def initialize(current_user)
    @client = Strava::Api::V3::Client.new(:access_token => "#{current_user.token}")
  end

  def list_athlete_activities
    client.list_athlete_activities
  end

  def name(activity)
    activity["name"]
  end

  def type(activity)
    activity["type"]
  end

  def start_date(activity)
    activity["start_date"]
  end  

  def distance(activity)
    activity["distance"]
  end

  def duration(activity)
    activity["moving_time"]
  end  

  def elapsed_time(activity)
    activity["elapsed_time"]
  end

  def total_elevation_gain(activity)
    activity["total_elevation_gain"]
  end

  def elev_high(activity)
    activity["elev_high"]
  end

  def elev_low(activity)
    activity["elev_low"]
  end

  def average_speed(activity)
    activity["average_speed"]
  end  

  def max_speed(activity)
    activity["max_speed"]
  end  

  def average_heartrate(activity)
    activity["average_heartrate"]
  end  

  def max_heartrate(activity)
    activity["max_heartrate"]
  end

  def start_location(activity)
    activity["start_latlng"]
  end

  

end