module Formatter
  
  def meter_to_mile
    (0.00062137119)
  end

  def meter_to_foot
    (3.28084)
  end

  def second_to_minute
    (0.01666667)
  end

  def mph_conversion
    (2.23694)
  end

  def time_converter(total_seconds)
    total_minutes = (total_seconds * second_to_minute)
    hours = (total_minutes / 60).to_i
    minutes = (total_minutes % 60).to_i
    time_formatter(hours, minutes)
  end

  def time_formatter(hours, minutes)
    if hours == 0
      "#{minutes} mins"
    else 
      "#{hours}hr #{minutes}m"
    end
  end

  def pace_converter(activity)
    minutes = (60.0 / average_speed(activity)).to_i
    seconds = ((60.0 / average_speed(activity) - minutes) * 60).to_i
    format_pace(minutes, seconds)
  end

  def format_pace(minutes, seconds)
    if seconds < 10
      "#{minutes}:0#{seconds}"
    else
      "#{minutes}:#{seconds}"
    end
  end

  # def format_year(activity)
  #   binding.pry
  #   activity["start_date_local"].split("-").first
  # end

  def format_date(activity)
    activity["start_date_local"].split("T").first[5..-1]
  end

  def format_time(activity)
    activity["start_date_local"].split("T").last.chop
  end

  # def format_year(workout)
  #   datetime(workout).split("-")[0]
  # end

  # def format_month(workout)
  #   datetime(workout).split("-")[1]
  # end

  # def format_day(workout)
  #   datetime(workout)[8..9]
  # end

  # def format_hour(workout)
  #   hour = (datetime(workout).split("T")[1].split(":")[0])
  # end

  # def format_minute(workout)
  #   datetime(workout).split("T")[1].split(":")[1]
  # end

  # def datetime(workout)
  #   workout["start_datetime"]
  # end
end