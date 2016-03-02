require 'test_helper'

class UserDashboardTest < ActionDispatch::IntegrationTest

  def login
    @user = create(:user)
    visit root_path
    click_on "Login with Strava"
  end

  test 'user views monthly stats on dashboard' do
    login
    VCR.use_cassette('stats') do
      visit dashboard_path
      assert_equal dashboard_path, current_path
      
      assert page.has_content?(@user.first_name)
      assert page.has_content?(@user.city)
      assert page.has_content?(@user.state)
      assert page.has_content?("Monthly Stats")
      assert page.has_content?("sessions")
      assert page.has_content?("miles")
      assert page.has_content?("hr")
      assert page.has_content?("m")
      assert page.has_content?("feet")
    end
  end

  test 'user views dashboard navbar' do 
    login
    VCR.use_cassette('stats') do
      visit dashboard_path
      assert_equal dashboard_path, current_path

      within("nav") do 
        assert page.has_content?("PAINCAVER")
        assert page.has_content?("View Workouts")
        assert page.has_content?("Dashboard")
        assert page.has_content?("Logout")
      end
    end
  end

end