class User < ActiveRecord::Base
  has_many :user_races
  
  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(provider: auth[:provider], user_id: auth[:uid])
    user.token = auth[:credentials][:token]
    user.name = auth[:info][:name]
    user.first_name = auth[:info][:first_name]
    user.last_name = auth[:info][:last_name]
    user.email = auth[:info][:email]
    user.profile_picture = auth[:extra][:raw_info][:profile]
    user.city = auth[:extra][:raw_info][:city]
    user.state = auth[:extra][:raw_info][:state]
    user.sex = auth[:extra][:raw_info][:sex]
    user.athlete_type = auth[:extra][:raw_info][:athlete_type]
    user.weight = auth[:extra][:raw_info][:weight]
    user.shoes = shoe_mileage(auth)
    user.follower_count = auth[:extra][:raw_info][:follower_count]
    user.friend_count = auth[:extra][:raw_info][:friend_count]

    user.save
    return user
  end

  def self.shoe_mileage(auth)
    shoes = auth[:extra][:raw_info][:shoes]
    shoes.map do |shoe|
      {shoe[:name] => shoe[:distance]}
    end
  end
end
