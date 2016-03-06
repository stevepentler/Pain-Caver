require 'test_helper'

class TrailServiceTest

  test 'trail attributes' do 
    VCR.use_cassette('trails') do 
      user = create(:user)
      service = TrailService.new(current_user)
    end
  end
end