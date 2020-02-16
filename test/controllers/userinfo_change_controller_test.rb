require 'test_helper'

class UserinfoChangeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get userinfo_change_new_url
    assert_response :success
  end

  test "should get update" do
    get userinfo_change_update_url
    assert_response :success
  end

end
