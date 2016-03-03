require 'test_helper'

class UserRaceCrudTest < ActionDispatch::IntegrationTest
  def login
    @user = create(:user)
    visit root_path
    click_on "Login with Strava"
  end

  test "user adds a race" do 
    login
    visit dashboard_path
    assert_equal dashboard_path, current_path

    click_on "Add a Race"
    assert_equal new_user_race_path, current_path

    assert page.has_content?("Date")
    fill_in "user_race[date]", with: "05-23-1991"
    assert page.has_content?("Title")
    fill_in "user_race[title]", with: "Quit"
    assert page.has_content?("Distance")
    fill_in "user_race[distance]", with: "1"
    assert page.has_content?("Target time")
    fill_in "user_race[target_time]", with: "1hr"
    assert page.has_content?("Location")
    fill_in "user_race[location]", with: "Wisconsin"
    assert page.has_content?("Start time")
    fill_in "user_race[start_time]", with: "10PM"
    click_on "Add Race"

    assert_equal dashboard_path, current_path
    assert page.has_content?("05-23-1991")
    assert page.has_content?("Quit")
    assert page.has_content?("1")
    assert page.has_content?("1hr")
    assert page.has_content?("Wisconsin")
    assert page.has_content?("10PM")
  end

  test "user edits a race" do 
    login
    user_race = create(:user_race)
    visit dashboard_path
    assert_equal dashboard_path, current_path
 
    click_on "edit"
    assert_equal edit_user_race_path(user_race.id), current_path

    assert page.has_content?("Date")
    fill_in "user_race[date]", with: "05-23-1991"
    assert page.has_content?("Title")
    fill_in "user_race[title]", with: "Quit"
    assert page.has_content?("Distance")
    fill_in "user_race[distance]", with: "1"
    assert page.has_content?("Target time")
    fill_in "user_race[target_time]", with: "1hr"
    assert page.has_content?("Location")
    fill_in "user_race[location]", with: "Wisconsin"
    assert page.has_content?("Start time")
    fill_in "user_race[start_time]", with: "10PM"
    click_on "Update Race"

    assert_equal dashboard_path, current_path
    assert page.has_content?("05-23-1991")
    assert page.has_content?("Quit")
    assert page.has_content?("1")
    assert page.has_content?("1hr")
    assert page.has_content?("Wisconsin")
    assert page.has_content?("10PM")
  end

  test "user removes a race" do 
    login
    user_race = create(:user_race)
    visit dashboard_path
    assert_equal dashboard_path, current_path

    click_on "remove"

    refute page.has_content?(user_race.title)
    refute page.has_content?(user_race.date)
    refute page.has_content?(user_race.distance)
    refute page.has_content?(user_race.target_time)
  end 
end