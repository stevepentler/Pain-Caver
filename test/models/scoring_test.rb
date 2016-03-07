require 'test_helper'

class ScoringTest < ActiveSupport::TestCase
  include Scoring

  test "elevation factors" do
    current_user = create(:user)
    leadville = Race.create(elevation_gain: 18168.0,
                            max_elevation: 12600.0,
                            distance: 100.0)
    colfax = Race.create(elevation_gain: 179,
                         max_elevation: 5375,
                         distance: 13.1)
    
    service = ActivityService.new(current_user, leadville) 
    assert_equal 6.106890756302521, service.elevation_gain_factor
    assert_equal 2400.0, service.max_elevation_factor

    service2 = ActivityService.new(current_user, colfax) 
    assert_equal 0.45929822310603635, service2.elevation_gain_factor
    assert_equal 1023.8095238095239, service2.max_elevation_factor
  end

  test "heartrate factors" do 
    assert_equal 190, possible_heartrate
    assert_equal 152, ideal_heartrate
    assert_equal 11.555555555555555, heartrate_factor
  end

  test 'distance factors' do 
    current_user = create(:user)
    leadville = Race.create(distance: 100.0)
    colfax = Race.create(distance: 13.2)
    
    service = ActivityService.new(current_user, leadville) 
    assert_equal 1.6666666666666667, service.distance_factor

    service2 = ActivityService.new(current_user, colfax)
    assert_equal 0.22, service2.distance_factor

  end
end