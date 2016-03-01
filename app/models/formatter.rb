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

  def miles_per_hour_conversion
    (2.23694)
  end

  def format_pace(minutes, seconds)
    if seconds < 10
      "#{minutes}:0#{seconds}"
    else
      "#{minutes}:#{seconds}"
    end
  end

  def time_converter(total_seconds)
      total_minutes = (total_seconds * second_to_minute)
      hours = (total_minutes / 60).to_i
      minutes = (total_minutes % 60).to_i
      return "#{hours}hr #{minutes}mins"
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