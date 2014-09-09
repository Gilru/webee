require 'test_helper'

class DevicesControllerTest < ActionController::TestCase
  test "should get responsive" do
    get :responsive
    assert_response :success
  end

end
