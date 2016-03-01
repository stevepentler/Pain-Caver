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
end
