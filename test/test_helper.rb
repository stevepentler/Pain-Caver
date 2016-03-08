ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'capybara/rails'
require 'vcr'
require 'minitest-vcr'
require 'webmock'
require 'database_cleaner'
require 'mocha/mini_test'
require 'minitest/pride'

SimpleCov.start 'rails'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  def teardown 
    DatabaseCleaner.clean
  end
  
  class ActionDispatch::IntegrationTest
    include Capybara::DSL
  end

  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes'
    config.hook_into :webmock
    config.allow_http_connections_when_no_cassette = true
  end
  
  MinitestVcr::Spec.configure!

  OmniAuth.config.test_mode = true
  omniauth_hash = 
  {"provider"=>"strava",
   "uid"=>"13541251",
   "info"=>{"name"=>"Steve Pentler", "first_name"=>"Steve", "last_name"=>"Pentler", "email"=>"stevepentler@gmail.com", "location"=>" "},
   "credentials"=>{"token"=> ENV['USER_TOKEN'], "expires"=>false},
   "extra"=>
    {"raw_info"=>
      {"id"=>13541251,
       "username"=>"spentler",
       "resource_state"=>3,
       "firstname"=>"Steve",
       "lastname"=>"Pentler",
       "profile_medium"=>"https://lh4.googleusercontent.com/-xXqkgEoPVCc/AAAAAAAAAAI/AAAAAAAAA1M/_EEbUWVP6jY/photo.jpg",
       "profile"=>"https://lh4.googleusercontent.com/-xXqkgEoPVCc/AAAAAAAAAAI/AAAAAAAAA1M/_EEbUWVP6jY/photo.jpg",
       "city"=>"Denver",
       "state"=>"Colorado",
       "country"=>"USA",
       "sex"=>"M",
       "premium"=>false,
       "created_at"=>"2016-02-21T06:22:41Z",
       "updated_at"=>"2016-02-22T04:16:28Z",
       "follower_count"=>0,
       "friend_count"=>3,
       "athlete_type"=>1,
       "measurement_preference"=>"feet",
       "email"=>"stevepentler@gmail.com",
       "weight"=>77.1107,
       "bikes"=>[{"id"=>"b2647226", "primary"=>true, "name"=>"LeMond", "resource_state"=>2, "distance"=>0.0}],
       "shoes"=>
        [{"id"=>"g1261219", "primary"=>false, "name"=>"ASICS Gel Nimbus 17 Asics", "resource_state"=>2, "distance"=>0.0},
         {"id"=>"g1261218", "primary"=>true, "name"=>"Saucony Peregrine Peregrine 4", "resource_state"=>2, "distance"=>9688.0}]
      }
    }
  }

  OmniAuth.config.add_mock(:strava, omniauth_hash)

end
