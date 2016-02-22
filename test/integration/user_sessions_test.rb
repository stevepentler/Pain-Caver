require 'test_helper'

class UserSessionsTestTest < ActionDispatch::IntegrationTest
  def login
    OmniAuth.config.mock_auth[:strava]
  end

  test "successful user login" do 
    user = users(:steve)
    visit root_path
    click_on "Login with Strava"
    
    visit dashboard_path
    assert page.has_content?(user.name)
    assert page.has_content?(user.email)
  end

  test "sucessful user logout" do
    login
    user = users(:steve)
    visit dashboard_path
    assert page.has_content?(user.name)
    assert page.has_content?(user.email)

    click_on "Logout"
    assert_equal root_path, current_path
    assert page.has_content?("Tempo")
  end

end
