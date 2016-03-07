require 'test_helper'

class UserTest < ActiveSupport::TestCase













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