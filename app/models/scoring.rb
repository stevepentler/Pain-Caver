module Scoring
  
  def elevation_gain_factor
    gain_per_mile = (race.elevation_gain  / race.distance)     #Leadville 100 is the standard (18168ft/100miles)
    factor = gain_per_mile / 29.75     #85% of elevation score(max of 35%)   
  end

  def max_elevation_factor
    race.max_elevation / 5.25  #15% of elevation score
  end

  def possible_heartrate               
    190.0                       #Average 100% heartrate for 30 year old
  end

  def ideal_heartrate
    (possible_heartrate * 0.80).to_i       #Aerobic Zone is 70-80% of heartrate
  end

  def heartrate_factor                                    
    factor = (ideal_heartrate - 100) / 4.5                        #90% of heartrate score
  end

  def distance_factor
    factor = race.distance / 60.0
  end

end