require 'test_helper'

class UserDashboardTest < ActionDispatch::IntegrationTest

  def login_and_create_tip
    @user = create(:user)
    running_tip = create(:running_tip)
    visit root_path
    click_on "Login with Strava"
    visit dashboard_path
  end

  test 'user views monthly stats on dashboard' do
    login_and_create_tip
    VCR.use_cassette('stats') do
      
      assert_equal dashboard_path, current_path
      assert page.has_content?(@user.name)
      assert page.has_content?("Year to Date")
      assert page.has_content?("miles")
      assert page.has_content?("sessions")
      assert page.has_content?("hr")
      assert page.has_content?("m")
      assert page.has_content?("gain")
    end
  end

  test 'user views elite runner options' do
    login_and_create_tip
    
    assert_equal dashboard_path, current_path
    assert page.has_content?("Elite Runner")
    assert page.has_content?("Anton Krupicka")
    assert page.has_content?("Killian Jornet")
    assert page.has_content?("Jenn Shelton")
  end

  test 'user views running tip on dashboard' do
    login_and_create_tip
    visit dashboard_path
    assert_equal dashboard_path, current_path

    assert page.has_content?("Running Tip")
  end

  test 'user views upcoming races on dashboard' do
    user_race = create(:user_race)
    login_and_create_tip
    assert_equal dashboard_path, current_path

    assert page.has_content?("Upcoming Races")
    assert page.has_content?("Date")
    assert page.has_content?(user_race.date)
    assert page.has_content?("Title")
    assert page.has_content?(user_race.title)
    assert page.has_content?("Distance")
    assert page.has_content?(user_race.distance)
    assert page.has_content?("Target Time")
    assert page.has_content?(user_race.target_time)
    assert page.has_content?("Location")
    assert page.has_content?(user_race.location)
    assert page.has_content?("Start Time")
    assert page.has_content?(user_race.start_time)
    assert page.has_content?("edit")
    assert page.has_content?("remove")
  end

  test 'user views dashboard without user_races' do
    login_and_create_tip
    assert_equal dashboard_path, current_path

    assert page.has_content?("Add a Race or Goal")
    assert page.has_content?(@user.name)

  end

  test 'user views dashboard navbar' do 
    login_and_create_tip
    VCR.use_cassette('stats') do
      
      assert_equal dashboard_path, current_path
      within("nav") do 
        assert page.has_content?("PAINCAVER")
        assert page.has_content?("View Workouts")
        assert page.has_content?("Dashboard")
        assert page.has_content?("Logout")
      end
    end
  end

  test 'user views dashboard running tip' do 
    user = create(:user)
    running_tip = create(:running_tip)
    visit root_path
    click_on "Login with Strava"
    visit dashboard_path

    assert page.has_content?(running_tip.tip)
    assert page.has_content?(user.name)
  end

end