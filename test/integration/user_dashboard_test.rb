require 'test_helper'

class UserDashboardTest < ActionDispatch::IntegrationTest

  test 'user views dashboard' do
    VCR.use_cassette('user') do
      user = create(:user)
    
      visit dashboard_path
      assert_equal dashboard_path, current_path
      assert page.has_content?()
    end
  end

end