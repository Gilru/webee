require 'test_helper'

class InfoControllerTest < ActionController::TestCase
  test "should get why_us" do
    get :why_us
    assert_response :success
  end

end
