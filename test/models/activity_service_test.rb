require "test_helper"

class ActivityServiceTest < ActiveSupport::TestCase

  test "#data" do
    VCR.use_cassette('activity') do
      current_user = create(:user)
      service = ActivityService.new(current_user)
      activity = service.single_activity(505114540)

      assert_equal 505114540, service.activity_id(activity)
      assert_equal "Morning Run", service.name(activity)
      assert_equal "Run", service.type(activity)
      assert_equal "02-28", service.start_date(activity)
      assert_equal "10:38:22", service.start_time(activity)
      assert_equal 4.35, service.distance(activity)
      assert_equal "48 mins", service.duration(activity)
      assert_equal "1hr 16m", service.elapsed_time(activity)
      assert_equal 461.1, service.total_elevation_gain(activity)
      assert_equal 2121, service.elev_high(activity)
      assert_equal 1744, service.elev_low(activity)
      assert_equal "11:09", service.average_pace(activity)
      assert_equal 5.38, service.average_speed(activity)
      assert_equal 44.52, service.max_speed(activity)
      assert_equal 163, service.average_heartrate(activity)
      assert_equal 179, service.max_heartrate(activity)
    end
  end
end