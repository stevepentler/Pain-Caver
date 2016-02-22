class User < ActiveRecord::Base
  def self.find_or_create_by_auth(auth)
    binding.pry
    user = User.find_or_create_by(provider: auth['provider'], user_id: auth["uid"])
  end
end
