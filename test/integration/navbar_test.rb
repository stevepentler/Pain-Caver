require 'test_helper'

class NavbarTest < ActionDispatch::IntegrationTest
  
  test 'View Workout link for navbar' do 
    login_and_visit_dashboard
    race = create(:race)
    within("nav") do 
      click_on("View Workouts")
      assert_equal workouts_path, current_path
    end
  end

  test 'Dashboard link for navbar' do 
    login_and_visit_dashboard
    race = create(:race)
    within("nav") do 
      click_on("Dashboard")
      assert_equal dashboard_path, current_path
    end
  end

  test 'Logout link for navbar' do 
    login_and_visit_dashboard
    race = create(:race)
    within("nav") do 
      click_on("Logout")
      assert_equal root_path, current_path
    end
  end

  test 'Logo link for navbar' do 
    login_and_visit_dashboard
    race = create(:race)
    within("nav") do 
      click_on("PAINCAVER")
      assert_equal dashboard_path, current_path
    end
  end
end