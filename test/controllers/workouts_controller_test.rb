require 'test_helper'

class WorkoutsControllerTest < ActionController::TestCase
  test '#index' do  
    VCR.use_cassette('workouts_controller') do 
      user = create(:user)
      running_tip = create(:running_tip)
      user_stats = UserStatistic.create(user_id: user.id,)
      ApplicationController.any_instance.stubs(:current_user).returns(user)
      
      get :index

      assert_response :success
    end
  end

  test '#show' do 
    VCR.use_cassette('workout_controller') do
      user = create(:user)
      running_tip = create(:running_tip)
      race = create(:race)
      user_stats = UserStatistic.create(user_id: user.id)
      ApplicationController.any_instance.stubs(:current_user).returns(user)
      
      get :show, id: 509570036

      assert_response :success
    end
  end
end