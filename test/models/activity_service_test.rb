require "test_helper"

class ActivityServiceTest < ActiveSupport::TestCase

  test "#activity_service" do
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

  test "#activity_service scoring for user workout" do 
    VCR.use_cassette('activity') do
      current_user = create(:user)
      service = ActivityService.new(current_user)
      activity = service.single_activity(505114540)

      assert_equal 16.02, service.difficulty_rating(activity)
      assert_equal 4.667547335975342, service.score_elevation_gain(activity)
      assert_equal 0.33666666666666667, service.score_elevation_max(activity)
      assert_equal 5.0, service.score_elevation(activity)
      assert_equal 9.651315789473683, service.score_heartrate_average(activity)
      assert_equal 0.9421052631578948, service.score_heartrate_max(activity)
      assert_equal 10.59, service.score_heartrate(activity)
      assert_equal 0.43, service.score_duration(activity)
    end
  end 

  test "#activity_service scoring for Leadville 100" do 
    current_user = create(:user)
    service = ActivityService.new(current_user)
    activity = {"total_elevation_gain"=>18168,
                "distance"=>160934.4,
                "elev_high"=>12600,
                "average_heartrate"=>152,
                "max_heartrate"=> 190
                }

    assert_equal 30.0, service.difficulty_rating(activity)
    assert_equal 8, service.score_elevation_gain(activity)
    assert_equal 2, service.score_elevation_max(activity)
    assert_equal 10, service.score_elevation(activity)
    assert_equal 9, service.score_heartrate_average(activity)
    assert_equal 1, service.score_heartrate_max(activity)
    assert_equal 10, service.score_heartrate(activity)
    assert_equal 10, service.score_duration(activity)
  end 
end