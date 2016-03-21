class User < ActiveRecord::Base
  has_many :user_races
  has_one :user_statistic
  validates :provider, presence: true, acceptance: {accept: 'strava'}
  validates :user_id, presence: true
  validates :token, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(provider: auth[:provider], user_id: auth[:uid])
    user_attributes(user, auth)
    user.save
    return user
  end

  def self.user_attributes(user, auth)
    user.token = auth[:credentials][:token]
    user.email = auth[:info][:email]
    user.name = auth[:info][:name]
    user.first_name = auth[:info][:first_name]
    user.last_name = auth[:info][:last_name]
    user.profile_picture = auth[:extra][:raw_info][:profile]
    user.city = auth[:extra][:raw_info][:city] || "Denver"
    user.state = auth[:extra][:raw_info][:state]
    user.sex = auth[:extra][:raw_info][:sex]
    user.athlete_type = auth[:extra][:raw_info][:athlete_type]
    user.weight = auth[:extra][:raw_info][:weight]
    user.shoes = auth[:extra][:raw_info][:shoes]
    user.follower_count = auth[:extra][:raw_info][:follower_count]
    user.friend_count = auth[:extra][:raw_info][:friend_count]
  end

end
