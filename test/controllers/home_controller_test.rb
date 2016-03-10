require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test '#show' do  
    VCR.use_cassette('home_controller') do 
      
      get :show

      assert_response :success
    end
  end
end