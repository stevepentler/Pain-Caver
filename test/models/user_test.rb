require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
test 'attributues' do 
  # assert_equal 0, User.count
  # user = User.find_or_create_by_auth(auth_hash)
  # assert_equal 1, User.count
end














def auth_hash
  {"provider"=>"strava",
   "uid"=>"13541251",
   "info"=>
    {"name"=>"Steve Pentler",
     "first_name"=>"Steve",
     "last_name"=>"Pentler",
     "email"=>"stevepentler@gmail.com",
     "location"=>"Denver Colorado"
    }
  }
 end
end