require 'test_helper'

class UserRaceTest < ActiveSupport::TestCase
  test 'create user_race' do 
    user = create(:user) 
    assert_difference 'UserRace.count', 1 do 
      race = UserRace.create( user_id: user.id,
                              title: "Revel Rockies",
                              date: "06-12-2016",
                              distance: 26.2,
                              target_time: "3:00",
                              location: "Morrison, CO",
                              start_time: "7AM")

      assert_equal user.id, user.user_races.first.user_id
      assert_equal "Revel Rockies", user.user_races.first.title
      assert_equal "06-12-2016", user.user_races.first.date
      assert_equal 26.2, user.user_races.first.distance
      assert_equal "3:00", user.user_races.first.target_time
      assert_equal "Morrison, CO", user.user_races.first.location
      assert_equal "7AM", user.user_races.first.start_time
      assert_equal 1, user.user_races.count
    end
    assert_equal user.id, UserRace.first.user_id
  end
end
