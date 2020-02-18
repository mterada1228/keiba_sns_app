require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get signup_path
    assert_response :success
  end
  
  test "ユーザ検索のテスト" do
    
    # 全件取得
    get users_path
    assert User.all.count, @users
    
    # 検索後
    get users_path, params: { search: "Michael"}
    assert users(:michael), @users
    
  end

end
