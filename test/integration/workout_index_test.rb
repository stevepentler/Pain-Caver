require 'test_helper'

class WorkoutIndexTest < ActionDispatch::IntegrationTest
  test 'user views Anton stats' do 
    login_and_visit_workouts
    
    within("#anton-recent") do 
      assert page.has_content?("Anton Krupicka")
      assert page.has_content?("Monthly Stats")
      assert page.has_content?("40.6 miles/week")
      assert page.has_content?("2 sessions/week")
      assert page.has_content?("7hr 35min/week")
      assert page.has_content?("Bio")
    end
  end

  test 'user views running_tip' do 
    login_and_visit_workouts
    
    within("#anton-recent") do 
      assert page.has_content?("Running Tip")
      assert page.has_content?(@running_tip.tip)
    end
  end

  test 'user views their monthly stats' do 
    login_and_visit_workouts
    
    within("#user-recent") do 
      assert page.has_content?("miles")
      assert page.has_content?("sessions")
      assert page.has_content?("m")
      assert page.has_content?("gain")
    end
  end

  test 'user views workout index' do
    login_and_visit_workouts
    
    assert page.has_content?("Workouts")
    within("#workouts-index thead") do 
      assert page.has_content?("Date")
      assert page.has_content?("Start Time")
      assert page.has_content?("Title")
      assert page.has_content?("Distance")
      assert page.has_content?("Duration")
      assert page.has_content?("Pace")
      assert page.has_content?("View Details")
    end

    within("#workouts-index tbody") do 
      assert page.has_content?("Afternoon Run")
      assert page.has_content?("Triple Crown")
      assert page.has_content?("03-05")
      assert page.has_content?("13:35:10")
      assert page.has_content?("13.42 mi")
      assert page.has_content?("1hr 39m")
      assert page.has_content?("7:23")
      assert page.has_content?("details")
    end

  end



  def login_and_visit_workouts
    @user = create(:user)
    @running_tip = create(:running_tip)
    ApplicationController.any_instance.stubs(:current_user).returns(@user)
    VCR.use_cassette('activities') do 
      visit workouts_path
      assert_equal workouts_path, current_path
    end
  end
end