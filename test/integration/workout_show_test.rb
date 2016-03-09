require 'test_helper'

class WorkoutShowTest < ActionDispatch::IntegrationTest
  test 'user views course comparison options' do 
    login_and_visit_workout
    within("#race-selection") do 
      assert page.has_content?("Comparison")
      assert page.has_content?("Leadville 100")
      assert page.has_content?("Boston Marathon")
      assert page.has_content?("Western States")
      assert page.has_content?("Badwater 135")
      assert page.has_content?("Hardrock 100")
      assert page.has_content?("Colfax Half")
    end
  end

  test 'user views race details' do 
    login_and_visit_workout
    within("#race-details") do 
      assert page.has_content?("Leadville 100")
      assert page.has_content?("100.0 miles")
      assert page.has_content?("18,168 ft gain")
      assert page.has_content?("12,600 ft max")
      assert page.has_content?("Colorado")
      assert page.has_content?("Race Description")
    end
  end

  test 'user views workout difficulty' do 
    login_and_visit_workout
   
    assert page.has_content?("Triple Crown")
    within("#workout-difficulty") do 
      assert page.has_content?("Elevation")
      assert page.has_content?("Duration")
      assert page.has_content?("Heartrate")
      assert page.has_content?("Speed")
      assert page.has_content?("total gain")
      assert page.has_content?("352 ft")
      assert page.has_content?("max")
      assert page.has_content?("5379 ft")
      assert page.has_content?("min")
      assert page.has_content?("5250 ft")
      assert page.has_content?("rating/35")
      assert page.has_content?("6.54")
      assert page.has_content?("distance")
      assert page.has_content?("13.42")
      assert page.has_content?("duration")
      assert page.has_content?("1hr 39m")
      assert page.has_content?("elapsed")
      assert page.has_content?("1hr 42m")
      assert page.has_content?("rating/60")
      assert page.has_content?("8.05")
      assert page.has_content?("average")
      assert page.has_content?("167 bpm")
      assert page.has_content?("max")
      assert page.has_content?("177 bpm")
      assert page.has_content?("target")
      assert page.has_content?("152 bpm")
      assert page.has_content?("rating/5")
      assert page.has_content?("6.27")
      assert page.has_content?("pace")
      assert page.has_content?("7:23")
      assert page.has_content?("average")
      assert page.has_content?("8.12 mph")
      assert page.has_content?("max")
      assert page.has_content?("14.54 mph")
      assert page.has_content?("not rated")
    end
  end





















  def login_and_visit_workout
    @user = create(:user)
    race = create(:race)
    ApplicationController.any_instance.stubs(:current_user).returns(@user)
    VCR.use_cassette('activity-show') do 
      visit workout_path(509570036)
      assert_equal workout_path(509570036), current_path
    end
  end
end