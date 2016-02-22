require 'test_helper'

class UserSessionsTestTest < ActionDispatch::IntegrationTest
  def login
    OmniAuth.config.mock_auth[:strava]
  end

  test "succesful user login" do 
    user = users(:steve)
    visit root_path
    click_on "Login with Strava"
    
    visit dashboard_path
    assert page.has_content?(user.name)
    assert page.has_content?(user.email)
  end
end
