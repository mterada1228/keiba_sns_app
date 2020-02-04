require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end
  
  test "should get new" do
    get login_path
    assert_response :success
  end
  
  test "存在しないメールアドレスを入力した時のテスト" do
    post login_path, params: { session: { email: "", password: "" }}
    assert_not flash.empty?
    assert_template "sessions/new"
  end
  
  test "存在しないパスワードを入力した時のテスト" do
    post login_path, params: { session: { email: "michael@example.com", password: "notExist" }}
    assert_not flash.empty?
    assert_template "sessions/new"
  end

end
