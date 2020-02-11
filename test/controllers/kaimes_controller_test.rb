require 'test_helper'

class KaimesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get kaimes_create_url
    assert_response :success
  end

  test "should get delete" do
    get kaimes_delete_url
    assert_response :success
  end

end
