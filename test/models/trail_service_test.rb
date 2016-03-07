require 'test_helper'

class TrailServiceTest < ActiveSupport::TestCase

  test 'trail attributes' do 
    VCR.use_cassette('trails') do 
      current_user = create(:user)
      service = TrailService.new(current_user)
      trails = service.trails(current_user)
      trail_1 = trails.first
      trail_2 = trails.last
      trail_3 = trails[3]

      assert_equal 5, trails.count #limit 5
      assert_equal "Green Mountain", service.name(trail_1)
      assert_equal 7.0,service.distance(trail_1)
      assert_equal "hiking", service.type(trail_1)
      assert_equal "N/A", service.rating(trail_1)
      assert_equal "Denver", service.city(trail_1)
      assert_equal "Colorado", service.state(trail_1)
      assert_equal "With more than 2,400 acres of open space, William Frederick Hayden Park on Green Mountain is the second largest park in Lakewood. The park features a challenging network of multi-use trails. The summit, at 6,800 feet, offers unique and stunning views of the Denver metropolitan area to the east, as well as high mountain peaks to the west.", service.description(trail_1)
      assert_equal "From I-25, take 6th Ave. west. Drive approximately 6 miles to Kipling. Take Kipling south for 2 miles before taking a right on Alameda. Stay on Alameda for 3 miles until you see a parking area on the right. This trail is part of William Frederick Hayden Park.", service.directions(trail_1)
    
      assert_equal 5, trails.count #limit 5
      assert_equal "Colorado Trail", service.name(trail_2)
      assert_equal 535.0,service.distance(trail_2)
      assert_equal "hiking", service.type(trail_2)
      assert_equal "N/A", service.rating(trail_2)
      assert_equal "Denver", service.city(trail_2)
      assert_equal "Colorado", service.state(trail_2)
      assert_equal "The Colorado Trail offers amazing singletrack, incredible views, some steep high-altitude climbs, and it passes through 6 wilderness areas. It is probably Colorado's best long-distance backpacking trail.", service.description(trail_2)
      assert_equal "Multiple trailheads around the state, click one of the individual segment listings above to get directions to a particular staring point. From Denver, start off S. Platte Canyon Rd.", service.directions(trail_2)
    
      assert_equal 3.11, service.rating(trail_3)
    end
  end
end