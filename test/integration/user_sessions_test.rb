require 'test_helper'

class UserSessionsTest < ActionDispatch::IntegrationTest
  
  def login
    OmniAuth.config.mock_auth[:strava]
  end

  test "successful user login" do 
    VCR.use_cassette('user') do
      user = create(:user)

      visit root_path
      click_on "Login with Strava"
      
      assert_equal dashboard_path, current_path
      assert page.has_content?(user.name)
      assert page.has_content?("Year to Date")
      assert page.has_content?("Upcoming Races")
    end
  end

  test "sucessful user logout" do
    login
    VCR.use_cassette('user') do 
      user = create(:user)
      visit root_path
      click_on "Login with Strava"
      
      assert dashboard_path, current_path
      assert page.has_content?(user.name)
      assert page.has_content?("Year to Date")
      assert page.has_content?("Upcoming Races")

      click_on "Logout"
      assert_equal root_path, current_path
      assert page.has_content?("PAINCAVER")

      visit dashboard_path
      assert page.has_content?("Please login to access your data")
      assert_equal root_path, current_path
      assert page.has_content?("Login with Strava")
    end
  end

end
