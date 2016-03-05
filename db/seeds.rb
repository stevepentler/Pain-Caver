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

colfax_half = Race.create(title: "Colfax Half",
                          title_id: "colfax",
                          elevation_gain: 179,
                          max_elevation: 5375,
                          distance: 13.1,
                          description: "Fast, flat and shady, the Colfax Half Marathon is the only race to run through Denver Zoo! Denver’s springtime half marathon takes runners on a one mile trek through the zoo, through historic neighborhoods and through Aurora Fire Station #1. The Colorado Firefighter Calendar LIVE will cheer you on as you head to the finish line and after party in City Park.",
                          website: "http://www.runcolfax.org/races/half-marathon/",
                          course_record: "1:06:44",
                          city: "Denver",
                          state: "Colorado"
                          )

RunningTip.create(tip: "Increase weekly training mileage by no more than 10 percent per week.")
RunningTip.create(tip: "The most effective training mimics the event for which you’re training.")
RunningTip.create(tip: "The 2-Day Rule: If something hurts for two straight days while running, take two days off.")
RunningTip.create(tip: "If you’re about to bonk, eating something new is probably better than eating nothing at all.")
RunningTip.create(tip: "Runners improve for an average of seven years.")
RunningTip.create(tip: "Runners who only run are prone to injury.")
RunningTip.create(tip: "The best way to train your brain for a 50 is to run two long days in a row.")
RunningTip.create(tip: "Go out conservatively.")
RunningTip.create(tip: "No Excuses.")
RunningTip.create(tip: "Most people run a race to see who is fastest. I run a race to see who has the most guts. -Steve Prefontaine")
RunningTip.create(tip: "Everyone is an athlete. But some of us are training, and some of us are not.” —Dr. George Sheehan")
RunningTip.create(tip: "think in minutes, not miles.” —Budd Coates, four-time U.S. Olympic Marathon Trials qualifier/coach")
RunningTip.create(tip: "“The ‘talk test’ means running at a pace comfortable enough to converse with a training partner")
RunningTip.create(tip: "So-called ‘junk miles’—those slow miles done on easy days or during warmups—do count. They burn calories as effectively as fast miles; it just takes longer. - Hal Higdon")
RunningTip.create(tip: "Any idiot can train himself into the ground; the trick is doing the training that makes you gradually stronger. —Keith Brantly, U.S. Olympic marathoner")
RunningTip.create(tip: "Energy bars are good portable food for runners. Look for bars with 4 grams of fat or fewer per 230 calories. Fat slows down digestion. —Liz Applegate, Ph.D., sports nutritionist")
RunningTip.create(tip: "Think chest/hips/push, or CHP, when it’s time for uphill running. Chest up, hips forward, push strongly off each foot. —Jeff Galloway")
RunningTip.create(tip: "It’s better to run too slow at the start than too fast and get into oxygen debt, which is what 99.9 percent of runners do. You have to learn pace. —Bill Bowerman, renowned University of Oregon coach")
