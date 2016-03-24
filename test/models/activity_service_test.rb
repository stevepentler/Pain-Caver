require "test_helper"

class ActivityServiceTest < ActiveSupport::TestCase

  test "#activity_service" do
    VCR.use_cassette('activity') do
      current_user = create(:user)
      leadville = create(:race)
      service = ActivityService.new(current_user, leadville)
      activity = service.single_activity(505114540)

      assert_equal 505114540, service.activity_id(activity)
      assert_equal "Boulder: Green Mountain", service.name(activity)
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
      assert_equal 39.999133, service.start_latitude(activity)
      assert_equal -105.290421, service.start_longitude(activity)
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
    assert_equal 100, service.difficulty_range(activity)
    assert_equal 29.75, service.score_elevation_gain(activity)
    assert_equal 5.25, service.score_elevation_max(activity)
    assert_equal 35.0, service.score_elevation(activity)
    assert_equal 4.5, service.score_heartrate_average(activity)
    assert_equal 0.5, service.score_heartrate_max(activity)
    assert_equal 5, service.score_heartrate(activity)
    assert_equal 5, service.heartrate_range(activity)
    assert_equal 60, service.score_duration(activity)
    assert_equal "Your workout was 1.0x more difficult than", service.percentage_difficulty(activity)
  end 

  test "#activity_service NO HEARTRATE scoring for Leadville 100" do 
    current_user = create(:user)
    leadville = create(:race)
    service = ActivityService.new(current_user, leadville)
    activity = {"total_elevation_gain"=>5537.6064,
                "distance"=>160934.4,
                "elev_high"=>3840.48
                }

    assert_equal 95, service.difficulty_rating(activity)
    assert_equal 95, service.difficulty_range(activity)
    assert_equal 29.75, service.score_elevation_gain(activity)
    assert_equal 5.25, service.score_elevation_max(activity)
    assert_equal 35.0, service.score_elevation(activity)
    assert_equal "N/A", service.average_heartrate(activity)
    assert_equal "N/A", service.max_heartrate(activity)
    assert_equal "N/A", service.score_heartrate(activity)
    assert_equal "N/A", service.heartrate_range(activity)
    assert_equal 60, service.score_duration(activity)
  end 

  test "#activity service scopes to runs with max speed > 0.0" do 
    VCR.use_cassette('activities') do
      current_user = create(:user)
      leadville = create(:race)
      @service = ActivityService.new(current_user, leadville)
      activities = @service.list_athlete_activities

      activities.each do |activity|
        assert_equal "Run", @service.type(activity)
        assert @service.max_speed(activity) > 0.0
        refute_equal "Ride", @service.type(activity)
        refute_equal 0.0, @service.max_speed(activity)
      end
      assert_equal @service.list_athlete_activities.count, @service.count_activity_services
    end
  end

  test "#activity_service polylines" do 
    VCR.use_cassette('activity') do
      current_user = create(:user)
      leadville = create(:race)
      service = ActivityService.new(current_user, leadville)
      activity = service.single_activity(505114540)

      start_coordinates = {:lat=>39.99913, :lng=>-105.29043}
      midpoint_coordiantes = {:lat=>39.99225999999997, :lng=>-105.30658999999999}
      finish_coordinates = {:lat=>40.00492999999998, :lng=>-105.29307999999986}
      
      assert_equal start_coordinates, service.polyline(activity).first
      assert_equal finish_coordinates, service.polyline(activity).last
      assert_equal midpoint_coordiantes, service.midpoint(activity)
      assert_equal midpoint_coordiantes[:lat], service.midpoint_latitude(activity)
      assert_equal midpoint_coordiantes[:lng], service.midpoint_longitude(activity)
    end
  end


end