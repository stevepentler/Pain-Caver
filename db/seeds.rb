# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  Leadville = Race.create(name: "Leadville 100",
                          elevation_gain: 18168.0,
                          max_elevation: 12600.0,
                          distance: 100.0,
                          description: "The legendary \"Race Across The Sky\" 100-mile run is where it all started back in 1983. This is it. The race where legends are created and limits are tested. One hundred miles of extreme Colorado Rockies terrain — from elevations of 9,200 to 12,600 feet. You will give the mountain respect, and earn respect from all",
                          website: "http://www.leadvilleraceseries.com/run/leadvilletrail100run/"
                          )