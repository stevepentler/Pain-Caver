require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
    current_user = create(:user)
    tip = create(:tip)
    get :show, format: :json, current_user: current_user

    result = JSON.parse(response.body)
    binding.pry
    assert_response :success

end
