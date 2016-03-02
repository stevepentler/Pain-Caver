require 'test_helper'

class FormatterTest < ActiveSupport::TestCase
  include Formatter

  test "conversion factors" do 
    assert_equal (0.00062137119), meter_to_mile
    assert_equal (3.28084), meter_to_foot
    assert_equal (0.01666667), second_to_minute
    assert_equal (2.23694), mph_conversion
  end

  test "pace formatter" do
    assert_equal "7:05", format_pace(7, 5)
    assert_equal "7:10", format_pace(7, 10)
  end

  test "time converter" do 
    assert_equal "4hr 53m", time_converter(17630)
    assert_equal "1hr 0m", time_converter(3600)
    assert_equal "30 mins", time_converter(1800)
  end

  test "time formatter" do 
    assert_equal "5 mins", time_formatter(0, 5)
    assert_equal "55 mins", time_formatter(0, 55)
    assert_equal "1hr 0m", time_formatter(1, 0)
    assert_equal "1hr 15m", time_formatter(1, 15)
  end

  test "format pace" do 
    assert_equal "6:13", format_pace(6, 13)
    assert_equal "6:00", format_pace(6, 0)
    assert_equal "6:05", format_pace(6, 5)
  end

  test "format datetime" do 
    activity = {"start_date_local" => "2016-02-28T10:38:22Z"}
    assert_equal "02-28", format_date(activity)
    assert_equal "10:38:22", format_time(activity)
  end

end