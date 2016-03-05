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

  def all_trails(current_user)
    response = client.get("/?q[city_cont]=#{current_user.city}&q[state_cont]=#{current_user.state}&radius=25&limit=5")
    trails = JSON.parse(response.body)["places"]
  end

  def trails(current_user)
    all_trails(current_user).select do |trail|
      trail["activities"] && parse(trail)
    end
  end

  def single_trail(trail)
    response = client.get("/?q[city_cont]=#{city(trail)}&q[state_cont]=#{state(trail)}&q[activities_activity_name_cont]=#{name(trail)}&limit=1")
    trails = JSON.parse(response.body)["places"]
  end

  def name(trail)
    trail["name"]
  end

  def distance(trail)
    parse(trail)["length"]
  end

  def type(trail)
    parse(trail)["activity_type_name"]
  end

  def city(trail)
    trail["city"]
  end

  def state(trail)
    trail["state"]
  end


  # def description(trail)
  #   trail["activities"].last["description"]
  # end

  # def directions(trail)
  #   trail["directions"]
  # end


  private

  def parse(trail)
    trail["activities"].last
  end

  def headers
    {"X-Mashape-Key" => ENV['TRAIL_KEY'], 'Accept:' => 'json'}
  end
end

