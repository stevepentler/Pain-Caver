module Scoring
  def elevation_gain_factor
    feet_per_mile = (18168 / 100)     #Leadville 100 is the standard (18168ft/100miles)
    factor = feet_per_mile / 8.0        #80% of elevation score
  end

  def max_elevation_factor
    elevation = (12600)                     #Max elevation of Leadville 100
    elevation / 2.0                         #20% of elevation score
  end

  def possible_heartrate               #Average 100% heartrate for 30 year old
    190.0
  end

  def heartrate_factor
    aerobic_zone = (possible_heartrate * 0.80)       #Aerobic Zone is 70-80% of heartrate
    factor = aerobic_zone / 9.0                        #90% of heartrate score
  end

  def distance_factor
    distance = (100.0)
    factor = distance / 10.0
  end
  
end