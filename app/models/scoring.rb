module Scoring
  def elevation_gain_factor
    gain_per_mile = (race.elevation_gain / race.distance)     #Leadville 100 is the standard (18168ft/100miles)
    factor = gain_per_mile / 8.0      #80% of elevation score
    # factor = 22.71        
  end

  def max_elevation_factor
    race.max_elevation / 2.0                    #Max elevation of Leadville 100/ 2.0                         #20% of elevation score
  end

  def possible_heartrate               #Average 100% heartrate for 30 year old
    190.0
  end

  def heartrate_factor
    aerobic_zone = (possible_heartrate * 0.80)       #Aerobic Zone is 70-80% of heartrate
    factor = aerobic_zone / 9.0                        #90% of heartrate score
  end

  def distance_factor
    factor = race.distance / 10.0
  end
end