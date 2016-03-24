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
    hours == 0 ? "#{minutes} mins" : "#{hours}hr #{minutes}m"
  end

  def pace_converter(activity)
    minutes = (60.0 / average_speed(activity)).to_i
    binding.pry
    seconds = ((60.0 / average_speed(activity) - minutes) * 60).to_i
    format_pace(minutes, seconds)
  end

  def format_pace(minutes, seconds)
    seconds < 10 ? "#{minutes}:0#{seconds}" : "#{minutes}:#{seconds}"
  end

  def format_date(activity)
    activity["start_date_local"].split("T").first[5..-1]
  end

  def format_time(activity)
    activity["start_date_local"].split("T").last.chop
  end

  def format_percentage(percent)
    if percent >= 1
      percentage = percent.round(2)
      "Your workout was #{percentage}x more difficult than"
    else
      percentage = (percent * 100).round(0)
      "Your workout was #{percentage}% as difficult as"
    end
  end

end