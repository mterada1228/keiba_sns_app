require 'test_helper'

class AdminTest < ActionDispatch::IntegrationTest

  test "admin権限がない場合" do
    user = users(:test1)
    log_in_as(user)
    get root_path
    assert_select "a[href=?]", admins_path, count: 0
    get admins_path
    follow_redirect!
    assert_template 'sessions/new'
  end

  test "admin権限がある場合" do
    user = users(:admin)
    log_in_as(user)
    get root_path
    follow_redirect!
    assert_select "a[href=?]", admins_path
    get admins_path
    assert_template 'admins/index'
  end

end
