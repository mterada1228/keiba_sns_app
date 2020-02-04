require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end
  
  test "ログイン成功時のテスト" do
    get login_path
    post login_path, params: { session: { email: "michael@example.com", password: "password" }}
    follow_redirect!
    follow_redirect!
    assert_template 'menu/show'
  end
end
