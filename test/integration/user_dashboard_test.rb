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
    end
  end

end