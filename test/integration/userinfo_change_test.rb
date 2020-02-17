require 'test_helper'

class UserinfoChangeTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @other = users(:other)
  end

  test 'ユーザ情報変更のテスト' do
  
    # ログインユーザ以外の情報は変更できない
    log_in_as(@other)
    get userinfo_change_new_path
    patch user_path(@user), params: { user: { name: "change", email: "change@co.jp" }}
    follow_redirect!
    follow_redirect!
    @user.reload
    assert_template 'menu/show'
    assert_equal 'Michael Example', @user.name
    assert_equal 'michael@example.com', @user.email
    
    # 情報が変更できる
    log_in_as(@user)
    get userinfo_change_new_path
    patch user_path(@user), params: { user: { name: "change", email: "change@co.jp" }}
    follow_redirect!
    @user.reload
    assert_template 'users/show'
    assert_equal 'change', @user.name
    assert_equal 'change@co.jp', @user.email

  end

end
