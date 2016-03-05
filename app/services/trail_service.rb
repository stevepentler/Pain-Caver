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
    response = client.get("/?q[city_cont]=#{current_user.city}&radius=20")
    trails = JSON.parse(response.body)["places"]
  end

  def trails(current_user)
    all_trails(current_user).select do |trail|
      trail["activities"] && trail["activities"].last
    end
  end

  # def single_trail(current_user)
  #   response = client.get("/?q[city_cont]=#{current_user.city}&radius=20")
  #   trails = JSON.parse(response.body)
  # end

  def name(trail)
    trail["name"]
  end

  def distance(trail)
    trail["activities"].last["length"]
  end

  def type(trail)
    trail["activities"].last["activity_type_name"]
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
    trails(current_user)["activities"].last
  end

  def headers
    {"X-Mashape-Key" => ENV['TRAIL_KEY'], 'Accept:' => 'json'}
  end
end

