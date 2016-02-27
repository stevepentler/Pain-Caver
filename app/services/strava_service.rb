class StravaService
  attr_reader :client, 
              :retrieve_current_athlete,
              :list_athlete_activities

  def initialize(current_user)
    @client = Strava::Api::V3::Client.new(:access_token => ENV['MY_ACCESS_TOKEN'])
    # @athlete = @client.retrieve_current_athlete
  end

  def retrieve_current_athlete
    client.retrieve_current_athlete
  end

  def list_athlete_activities
    client.list_athlete_activities
  end

end