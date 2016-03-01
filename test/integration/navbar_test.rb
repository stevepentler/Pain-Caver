require 'test_helper'

class NavbarTest < ActionDispatch::IntegrationTest

  def login
    @user = create(:user)
    visit root_path
    click_on "Login with Strava"
  end

  test 'links for navbar' do 
    skip
    login
    visit dashboard_path
    assert_equal dashboard_path, current_path

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