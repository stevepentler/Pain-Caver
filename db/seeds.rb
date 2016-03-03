leadville = Race.create(title: "Leadville 100",
                        title_id: "leadville",
                        elevation_gain: 18168.0,
                        max_elevation: 12600.0,
                        distance: 100.0,
                        description: "The legendary \"Race Across The Sky\" 100-mile run is where it all started back in 1983. This is it. The race where legends are created and limits are tested. One hundred miles of extreme Colorado Rockies terrain — from elevations of 9,200 to 12,600 feet. You will give the mountain respect, and earn respect from all.",
                        website: "http://www.leadvilleraceseries.com/run/leadvilletrail100run/",
                        course_record: "15:42:59",
                        city: "Leadville",
                        state: "Colorado"
                        )

western_states = Race.create(title: "Western States",
                             title_id: "western",
                             elevation_gain: 18090.0,
                             max_elevation: 8750.0,
                             distance: 100.2,
                             description: "The Western States ® 100-Mile Endurance Run is the world’s oldest and most prestigious 100-mile trail race. Starting in Squaw Valley, California near the site of the 1960 Winter Olympics and ending 100.2 miles later in Auburn, California, Western States, in the decades since its inception in 1974, has come to represent one of the ultimate endurance tests in the world.",
                             website: "http://www.wser.org/",
                             course_record: "14:46:44",
                             city: "Squaw Valley",
                             state: "California"
                             )

boston_marathon = Race.create(title: "Boston Marathon",
                              title_id: "boston",
                              elevation_gain: 783.0,
                              max_elevation: 490.0,
                              distance: 26.2,
                              description: "The Boston Marathon is the world's oldest annual marathon and ranks as one of the world's best-known road racing events. It is one of six World Marathon Majors.",
                              website: "http://www.baa.org/",
                              course_record: "2:03:02",
                              city: "Boston",
                              state: "Massachusetts"

                              )

badwater = Race.create(title: "Badwater 135",
                       title_id: "badwater",
                       elevation_gain: 14600.0,
                       max_elevation: 8300.0,
                       distance: 135.0,
                       description: "Covering 135 miles (217km) non-stop from Death Valley to Mt. Whitney, CA, the STYR Labs Badwater® 135 is the most demanding and extreme running race offered anywhere on the planet. The start line is at Badwater, Death Valley, which marks the lowest elevation in North America at 280’ (85m) below sea level. The race finishes at Whitney Portal at 8,300’ (2530m).",
                       website: "http://www.badwater.com/event/badwater-135/",
                       course_record: "22:51:29",
                       city: "Death Valley",
                       state: "California"                      
                      )

hardrock = Race.create(title: "Hardrock 100",
                       title_id: "hardrock",
                       elevation_gain: 33992.0,
                       max_elevation: 14048.0,
                       distance: 100.5,
                       description: "The run starts and ends in Silverton, Colorado and travels through the towns of Telluride, Ouray, and the ghost town of Sherman, crossing thirteen major passes in the 12,000' to 13,000' range. Entrants must travel above 12,000 feet (3,700 m) of elevation a total of 13 times, with the highest point on the course being the 14,048' summit of Handies Peak.",
                       website: "http://hardrock100.com/index.php",
                       course_record: "22:41:33",
                       city: "Silverton",
                       state: "Colorado"
                      )