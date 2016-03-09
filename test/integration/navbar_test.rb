require 'test_helper'

class NavbarTest < ActionDispatch::IntegrationTest
  
  test 'links for navbar' do 
    login_and_visit_dashboard
    race = create(:race)
    within("nav") do 
      click_on("View Workouts")
      assert_equal workouts_path, current_path
      click_on("Dashboard")
      assert_equal dashboard_path, current_path
      click_on("Logout")
      assert_equal root_path, current_path
    end
  end
end