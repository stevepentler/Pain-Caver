require 'test_helper'

class ScoringTest < ActiveSupport::TestCase
  include Scoring

  test "elevation scoring" do 
    assert_equal 22.625, elevation_gain_factor
    assert_equal 6300.0, max_elevation_factor
  end

  test "heartrate scoring" do 
    assert_equal 190, possible_heartrate
    assert_equal 16.88888888888889, heartrate_factor
  end

  test "duration scoring" do
    assert_equal 10, distance_factor
  end
end