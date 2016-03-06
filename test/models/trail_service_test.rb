require 'test_helper'

class TrailServiceTest < ActiveSupport::TestCase

  test 'trail attributes' do 
    VCR.use_cassette('trails') do 
      current_user = create(:user)
      service = TrailService.new(current_user)
    end
  end
end