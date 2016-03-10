require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test '#show' do
    VCR.use_cassette('dashboard_controller') do 
      @user = create(:user)
      @running_tip = create(:running_tip)
      ApplicationController.any_instance.stubs(:current_user).returns(@user)
      get :show

      assert_response :success
    end
  end
end
