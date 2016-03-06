require 'test_helper'

class UserSessionsTest < ActionDispatch::IntegrationTest
  
  def login
    OmniAuth.config.mock_auth[:strava]
  end

  test "successful user login" do 
    VCR.use_cassette('user') do
      user = create(:user)
      running_tip = create(:running_tip)
      
      visit root_path
      click_on "Login with Strava"
      
      assert_equal dashboard_path, current_path
      assert page.has_content?(user.name)
      assert page.has_content?("Year to Date")
      assert page.has_content?("Upcoming Races")
    end
  end

  test "sucessful user logout" do
    login
    VCR.use_cassette('user') do 
      user = create(:user)
      running_tip = create(:running_tip)
      visit root_path
      click_on "Login with Strava"
      
      assert dashboard_path, current_path
      assert page.has_content?(user.name)
      assert page.has_content?("Year to Date")
      assert page.has_content?("Upcoming Races")

      click_on "Logout"
      assert_equal root_path, current_path
      assert page.has_content?("PAINCAVER")

      visit dashboard_path
      assert page.has_content?("Please login to access your data")
      assert_equal root_path, current_path
      assert page.has_content?("Login with Strava")
    end
  end

  test "succesful user creation" do 
    VCR.use_cassette('user') do
      auth = OmniAuth.config.mock_auth[:strava]
      user = User.find_or_create_by_auth(auth)
      assert_equal ENV['USER_TOKEN'], user.token
      assert_equal 13541251, user.user_id
      assert_equal "Steve Pentler", user.name
      assert_equal "Steve", user.first_name
      assert_equal "Pentler", user.last_name
      assert_equal "stevepentler@gmail.com", user.email
      assert_equal "https://lh4.googleusercontent.com/-xXqkgEoPVCc/AAAAAAAAAAI/AAAAAAAAA1M/_EEbUWVP6jY/photo.jpg", user.profile_picture
      assert_equal "Denver", user.city
      assert_equal "Colorado", user.state
      assert_equal "M", user.sex
      assert_equal 1, user.athlete_type
      assert_equal "[{\"ASICS Gel Nimbus 17 Asics\"=>0.0}, {\"Saucony Peregrine Peregrine 4\"=>9688.0}]", user.shoes
      assert_equal "0", user.follower_count
      assert_equal "3", user.friend_count
      assert_equal [{"ASICS Gel Nimbus 17 Asics"=>0.0}, {"Saucony Peregrine Peregrine 4"=>9688.0}], User.shoe_mileage(auth)
    end
  end
  
end
