class StravaService
  attr_reader :client
  def initialize(current_user)
    @client = Strava::Api::V3::Client.new(:access_token => ENV['MY_ACCESS_TOKEN'])
  end

  def segment_effort(current_user)
    client.retrieve_a_segment_effort(id: current_user.user_id)
      binding.pry
  end
end