require "test_helper"

class ActivityServiceTest < ActiveSupport::TestCase

  test "#activity_service" do
    VCR.use_cassette('activity') do
      current_user = create(:user)
      leadville = create(:race)
      service = ActivityService.new(current_user, leadville)
      activity = service.single_activity(505114540)

      assert_equal 505114540, service.activity_id(activity)
      assert_equal "Morning Run", service.name(activity)
      assert_equal "Run", service.type(activity)
      assert_equal "02-28", service.start_date(activity)
      assert_equal "10:38:22", service.start_time(activity)
      assert_equal 4.35, service.distance(activity)
      assert_equal "48 mins", service.duration(activity)
      assert_equal "1hr 16m", service.elapsed_time(activity)
      assert_equal 1513, service.total_elevation_gain(activity)
      assert_equal 6959, service.elev_high(activity)
      assert_equal 5720, service.elev_low(activity)
      assert_equal "11:09", service.average_pace(activity)
      assert_equal 5.38, service.average_speed(activity)
      assert_equal 44.52, service.max_speed(activity)
      assert_equal 163, service.average_heartrate(activity)
      assert_equal 179, service.max_heartrate(activity)
    end
  end

  test "#activity_service scoring for user workout" do 
    VCR.use_cassette('activity') do
      current_user = create(:user)
      leadville = create(:race)
      service = ActivityService.new(current_user, leadville)
      activity = service.single_activity(505114540)

      assert_equal 68.38, service.difficulty_rating(activity)
      assert_equal 56.95469361312299, service.score_elevation_gain(activity)
      assert_equal 2.899583333333333, service.score_elevation_max(activity)
      assert_equal 59.85, service.score_elevation(activity)
      assert_equal 5.451923076923077, service.score_heartrate_average(activity)
      assert_equal 0.47, service.score_heartrate_max(activity)
      assert_equal 5.92, service.score_heartrate(activity)
      assert_equal 2.61, service.score_duration(activity)
    end
  end 

  test "#activity_service scoring for user workout" do 
    VCR.use_cassette('activity') do
      current_user = create(:user)
      leadville = create(:race)
      service = ActivityService.new(current_user, leadville)
      activity = service.single_activity(505114540)

      assert_equal 68.38, service.difficulty_rating(activity)
      assert_equal 56.95469361312299, service.score_elevation_gain(activity)
      assert_equal 2.899583333333333, service.score_elevation_max(activity)
      assert_equal 59.85, service.score_elevation(activity)
      assert_equal 5.451923076923077, service.score_heartrate_average(activity)
      assert_equal 0.47, service.score_heartrate_max(activity)
      assert_equal 5.92, service.score_heartrate(activity)
      assert_equal 2.61, service.score_duration(activity)
    end
  end 

  test "#activity_service scoring for Leadville 100" do 
    current_user = create(:user)
    leadville = create(:race)
    service = ActivityService.new(current_user, leadville)
    activity = {"total_elevation_gain"=>5537.6064,
                "distance"=>160934.4,
                "elev_high"=>3840.48,
                "average_heartrate"=>152,
                "max_heartrate"=> 190
                }

    assert_equal 100.0, service.difficulty_rating(activity)
    assert_equal 29.75, service.score_elevation_gain(activity)
    assert_equal 5.25, service.score_elevation_max(activity)
    assert_equal 35.0, service.score_elevation(activity)
    assert_equal 4.5, service.score_heartrate_average(activity)
    assert_equal 0.5, service.score_heartrate_max(activity)
    assert_equal 5, service.score_heartrate(activity)
    assert_equal 60, service.score_duration(activity)
  end 
end