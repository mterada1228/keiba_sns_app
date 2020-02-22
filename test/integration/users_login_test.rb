require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end
  
  test "ログイン / ログアウトのテスト" do
    
    # ログインする
    get login_path
    post login_path, params: { session: { email: "michael@example.com", password: "password" }}
    follow_redirect!
    follow_redirect!
    assert_template 'menus/show'
    # sidebarがログイン済のものとなっているか？
    assert_match @user.name, response.body
    # headerがログイン済のものとなっているか？
    assert_match logout_path, response.body
    
    # ログアウトする
    delete logout_path
    follow_redirect!
    follow_redirect!
    assert_template 'menus/show'
    # sidebarがログアウト済のものとなっているか？
    assert_match "ゲストさん", response.body
    # headerがログイン済のものとなっているか？
    assert_match login_path, response.body
    assert_match signup_path, response.body
  end

end
