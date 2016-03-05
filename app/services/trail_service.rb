class TrailService

  attr_reader :client, 
              :current_user

  def initialize(current_user)
    @client = Faraday.new("https://trailapi-trailapi.p.mashape.com") do |faraday|
      faraday.headers = headers
      faraday.adapter Faraday.default_adapter
    end
    @current_user = current_user
  end

  def trails(current_user)
    response = client.get("/?q[city_cont]=#{current_user.city}&radius=1&limit=1")
    response.body
    binding.pry
  end

  private

  def headers
    {"X-Mashape-Key" => ENV['TRAIL_KEY'], 'Accept:' => 'json'}
  end
end


# response = Unirest.get "https://trailapi-trailapi.p.mashape.com/?lat=34.1&limit=25&lon=-105.2&q[activities_activity_name_cont]=Yellow+River+Trail&q[activities_activity_type_name_eq]=hiking&q[city_cont]=Denver&q[country_cont]=Australia&q[state_cont]=California&radius=25",
#   headers:{
#     "X-Mashape-Key" => "6i8lVHF2P2mshefow8DfxClIqoThp11EYJRjsnN1jPfjky8BKA",
#     "Accept" => "text/plain"
#   }