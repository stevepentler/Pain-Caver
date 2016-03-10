FactoryGirl.define do 
  
  factory :user do
    user_id 13541251
    provider "strava"
    token ENV['USER_TOKEN']
    name "Steve Pentler"
    first_name "Steve"
    last_name "Pentler"
    email "stevepentler@gmail.com"
    profile_picture "https://lh4.googleusercontent.com/-xXqkgEoPVCc/AAAAAAAAAAI/AAAAAAAAA1M/_EEbUWVP6jY/photo.jpg"
    city "Denver"
    state "Colorado"
    sex "M" 
    athlete_type "1"
    weight "77.1107"
    shoes "[{\"ASICS Gel Nimbus 17 Asics\"=>0.0}, {\"Saucony Peregrine Peregrine 4\"=>9688.0}]"
    follower_count 0
    friend_count 3
  end

  factory :race do 
    title "Leadville 100"
    title_id "leadville"
    elevation_gain 18168.0
    max_elevation 12600.0
    distance 100.0
    description "The legendary \"Race Across The Sky\" 100-mile run is where it all started back in 1983. This is it. The race where legends are created and limits are tested. One hundred miles of extreme Colorado Rockies terrain — from elevations of 9,200 to 12,600 feet. You will give the mountain respect, and earn respect from all"
    website "http://www.leadvilleraceseries.com/run/leadvilletrail100run/"
  end

  factory :user_race do 
    user
    date "06-12-2016"
    title "Revel Rockies"
    distance 26.2
    target_time "3:00"
    location "Morrison, CO"
    start_time "7AM"
  end

  factory :running_tip do 
    tip "No excuses."
  end

end
