class User < ActiveRecord::Base
  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(provider: auth['provider'], user_id: auth["id"])
  end
end
