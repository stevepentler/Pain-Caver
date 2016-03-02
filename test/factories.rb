FactoryGirl.define do 
  
  factory :user do
    user_id 13541251
    provider "strava"
    token ENV['USER_TOKEN']
    name "Steve Pentler"
    first_name "Steve"
    last_name "Pentler"
    email "stevepentler@gmail.com"
    profile_picture "https://lh4.googleusercontent.com/-xXqkgEoPVCc/AAAAAAAAAAI/AAAAAAAAA1M/_EEbUWVP6jY/photo.jpg"
    city "Denver"
    state "Colorado"
    sex "M" 
    athlete_type "1"
    weight "77.1107"
    shoes "[{\"ASICS Gel Nimbus 17 Asics\"=>0.0}, {\"Saucony Peregrine Peregrine 4\"=>9688.0}]"
    follower_count 0
    friend_count 3
  end

  factory :race do 
    title "Leadville 100"
    title_id "leadville"
    elevation_gain 18168.0
    max_elevation 12600.0
    distance 100.0
    description "The legendary \"Race Across The Sky\" 100-mile run is where it all started back in 1983. This is it. The race where legends are created and limits are tested. One hundred miles of extreme Colorado Rockies terrain — from elevations of 9,200 to 12,600 feet. You will give the mountain respect, and earn respect from all"
    website "http://www.leadvilleraceseries.com/run/leadvilletrail100run/"
  end

  # factory :activity do 
  #   activity {"id"=>505114540,
  #    "resource_state"=>3,
  #    "external_id"=>"2016-02-28T17:38:22Z",
  #    "upload_id"=>556936270,
  #    "athlete"=>{"id"=>13541251, "resource_state"=>1},
  #    "name"=>"Morning Run",
  #    "distance"=>6993.8,
  #    "moving_time"=>2911,
  #    "elapsed_time"=>4584,
  #    "total_elevation_gain"=>461.1,
  #    "type"=>"Run",
  #    "start_date"=>"2016-02-28T17:38:22Z",
  #    "start_date_local"=>"2016-02-28T10:38:22Z",
  #    "timezone"=>"(GMT-07:00) America/Denver",
  #    "start_latlng"=>[39.999133, -105.290421],
  #    "end_latlng"=>[40.004933, -105.293079],
  #    "location_city"=>nil,
  #    "location_state"=>nil,
  #    "location_country"=>"",
  #    "start_latitude"=>39.999133,
  #    "start_longitude"=>-105.290421,
  #    "achievement_count"=>0,
  #    "kudos_count"=>0,
  #    "comment_count"=>0,
  #    "athlete_count"=>2,
  #    "map"=>
  #     {"id"=>"a505114540",
  #      "polyline"=>
  #       "qicsFdpsaSF?RMTAXEJG`@MN?HFb@|@l@bAh@fAZXDJ?ZB|@Xp@Nt@AlBF`@?JMb@CVBPAt@EXK\\?n@IFKb@]^QXOhAY`@CXMl@GVGHQr@CJUJI^JV^JN?THLJFT@VBfBDZIz@B^G^X|@BTCRJ\\@P?NIHBLAJ_@^KTC`@J`@Tj@PNDG?BJ?DNA^BHEZIJCRLPGTCT@FGP@B?JG?MLAP@JAFZr@NlAT^PDTLj@H?FEFKFYFGJZ?NFDJRLb@@PLBJRLDNAPLn@?XDR?x@GVDJCh@DFPBr@TRANLIXIHo@b@Yd@ONINQF[Bc@LI@g@KKDOl@DRTJTPb@dAPR@RDPFdALZDZVx@BNc@bAW\\DLTZFNRXDZAL@RHRJj@LHJAZs@Lk@HO\\Yv@a@h@Ej@SNYLIn@BDCBGn@J^@ZCx@?PCPE`@ARCPId@]t@w@JG^g@h@g@Vs@PQJUr@YDS?SF]j@u@HWLQhA}@|Bm@QBSL}A~AgLzMsBb@_@?m@MSMKC]Vu@O[P]\\g@Fo@Bs@f@SPs@`BEHKFe@yAWg@[_AL][yCEsAGSA]KSEYUk@MMUMQQG[Cm@PIb@DZSXITAf@aANSTQRCROJYMIo@Iw@AMOL{AIw@?q@G_@GMUUMO_@WGIu@s@MEUDGEJM\\ALUMEo@Ia@WUgAOc@Ei@@KJKJAIKFa@Rg@CKII@CTm@Do@OAEKGLY]Ss@Ca@Bg@\\]@Y?g@IYBo@CO[e@Ay@BmAFU@YFIA}@Gm@QU[GQIUU@g@LQFCP[Ry@JSJOH_@JCZsAVq@RYPeAD_@Lo@RgCBGAc@E_@CEw@i@aAaAk@_AeA{AQOw@c@_@Yy@eA]Qe@E{@YWMIS_@Gy@?o@Zw@lAUXWNmA\\YLe@Xq@f@QP_@`@Yh@g@VKDmA@[CgA[S?]JSNW`@[xBMJQ@m@QcBBYGGEG]IYWc@CvAZHd@FV@nAG^F",
  #      "resource_state"=>3,
  #      "summary_polyline"=>
  #       "qicsFdpsaSrCc@jEpL[fKgEfLhBfBb@vKw@jClArCm@vEtC~Ds@j@rCjAPfGnBl@wGpEbDhJw@pB|@pCn@fA|FiFjIWlJiMfEkBkPlQuHJ_HhFyAaE]}HiBqEbGyDcCe@CeFuDoCv@e@eCsCt@qGoAsBNgO}AkBrD{Jp@oJoK{K{F{AiMvJoFKuAvD}DSq@aBCvAhER"},
  #    "commute"=>false,
  #    "gear_id"=>"g1261218",
  #    "average_speed"=>2.403,
  #    "max_speed"=>19.9,
  #    "average_heartrate"=>162.6,
  #    "max_heartrate"=>179.0,
  #    "elev_high"=>2121.2,
  #    "elev_low"=>1743.5,
  #    "total_photo_count"=>0,
  #    "calories"=>884.4}
  #   end
end
