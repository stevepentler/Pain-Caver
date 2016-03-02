class ActivityService
  include Formatter
  attr_reader :client

  def initialize(current_user)
    @client = Strava::Api::V3::Client.new(:access_token => "#{current_user.token}")
  end

  def list_athlete_activities
    client.list_athlete_activities
  end

  def single_activity(id)
    client.retrieve_an_activity(id)
  end

  def activity_id(activity)
    activity["id"]
  end

  def name(activity)
    activity["name"]
  end

  def type(activity)
    activity["type"]
  end

  def start_date(activity)
    format_date(activity)
  end

  def start_year(activity)
    format_year(activity)
  end 

  def start_time(activity)
    activity["start_date_local"].split("T").last.chop
  end 

  def distance(activity)
    meters = activity["distance"] 
    miles = (meters * meter_to_mile).round(2)
  end

  def duration(activity)
    total_seconds = activity["moving_time"]
    time_converter(total_seconds)
  end  

  def elapsed_time(activity)
    total_seconds = activity["elapsed_time"]
    time_converter(total_seconds)
  end

  def total_elevation_gain(activity)
    activity["total_elevation_gain"]
  end

  def elev_high(activity)
    activity["elev_high"].to_i
  end

  def elev_low(activity)
    activity["elev_low"].to_i
  end

  def average_pace(activity)
    pace_converter(activity)
  end

  def average_speed(activity)
    mps = activity["average_speed"]
    mph = (mps * mph_conversion).round(2)
  end  

  def max_speed(activity)
    mps = activity["max_speed"]
    mph = (mps * mph_conversion).round(2)
  end  

  def average_heartrate(activity)
    activity["average_heartrate"].to_i
  end  

  def max_heartrate(activity)
    activity["max_heartrate"].to_i
  end

  def start_location(activity)
    activity["start_latlng"]
  end

  

end