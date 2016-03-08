require 'test_helper'

class UserTest < ActiveSupport::TestCase



test 'auth hash' do 
  assert_difference 'User.count', 1 do 
    user = User.find_or_create_by_auth(auth_hash)

    assert_equal ENV['USER_TOKEN'], user.token
    assert_equal ENV['USER_EMAIL'], user.email
    assert_equal "Steve Pentler", user.name
    assert_equal "Steve", user.first_name
    assert_equal "Pentler", user.last_name
    assert_equal "https://dgalywyr863hv.cloudfront.net/pictures/athletes/13541251/3953992/5/large.jpg", user.profile_picture
    assert_equal "Denver", user.city
    assert_equal "Colorado", user.state
    assert_equal "M", user.sex
    assert_equal 1, user.athlete_type
    assert_equal "[{\"ASICS Gel Nimbus 17 Asics\"=>42449.0}, {\"Saucony Peregrine Peregrine 4\"=>80085.0}]", user.shoes
    assert_equal "0", user.follower_count
    assert_equal "8", user.friend_count
  end
end 

test 'user has races' do
  user = create(:user) 
  race = UserRace.create( user_id: user.id,
                          title: "Revel Rockies",
                          date: "06-12-2016",
                          distance: 26.2,
                          target_time: "3:00",
                          location: "Morrison, CO",
                          start_time: "7AM")
  assert_equal "Revel Rockies", user.user_races.first.title
  assert_equal "06-12-2016", user.user_races.first.date
  assert_equal 26.2, user.user_races.first.distance
  assert_equal "3:00", user.user_races.first.target_time
  assert_equal "Morrison, CO", user.user_races.first.location
  assert_equal "7AM", user.user_races.first.start_time
end


def auth_hash
{provider: "strava",
 uid: "13541251",
 info: {name: "Steve Pentler", first_name: "Steve", last_name: "Pentler", email: "stevepentler@gmail.com", location: "Denver Colorado"},
 credentials: {token: "76d702a1cb0bcd86e7a85a8dde8f06c891edbd62", expires: false},
 extra: 
  {recent_ride_totals: nil,
   ytd_ride_totals: nil,
   all_ride_totals: nil,
   raw_info: 
    {id: 13541251,
     username: "spentler",
     resource_state: 3,
     firstname: "Steve",
     lastname: "Pentler",
     profile_medium: "https://dgalywyr863hv.cloudfront.net/pictures/athletes/13541251/3953992/5/medium.jpg",
     profile: "https://dgalywyr863hv.cloudfront.net/pictures/athletes/13541251/3953992/5/large.jpg",
     city: "Denver",
     state: "Colorado",
     country: "United States",
     sex: "M",
     premium: false,
     created_at: "2016-02-21T06:22:41Z",
     updated_at: "2016-03-04T01:14:44Z",
     badge_type_id: 0,
     friend: nil,
     follower: nil,
     follower_count: 0,
     friend_count: 8,
     mutual_friend_count: 0,
     athlete_type: 1,
     date_preference: "%m/%d/%Y",
     measurement_preference: "feet",
     email: "stevepentler@gmail.com",
     ftp: nil,
     weight: 77.1106,
     clubs: [],
     bikes: [{id: "b2647226", primary: true, name: "LeMond", resource_state: 2, distance: 22049.0}],
     shoes: 
      [{id: "g1261219", primary: false, name: "ASICS Gel Nimbus 17 Asics", resource_state: 2, distance: 42449.0},
       {id: "g1261218", primary: true, name: "Saucony Peregrine Peregrine 4", resource_state: 2, distance: 80085.0}]}}}
 end
end