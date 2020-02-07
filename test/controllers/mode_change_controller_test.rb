require 'test_helper'

class ModeChangeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get mode_change_new_url
    assert_response :success
  end

end
