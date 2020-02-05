require 'test_helper'

class UserCreateTest < ActionDispatch::IntegrationTest
  
  test "ユーザ作成のテスト" do
    get signup_path
    assert_select 'input[type=text]'
    assert_select 'input[type=file]'
    # 無効な送信
    post signup_path, params: { user: { name: "", email: "" } }
    assert_select 'div#error_explanation'
    # 有効な送信
    picture = fixture_file_upload('test/fixtures/files/terada_kokoro.jpg', 'image/jpg')
    assert_difference 'User.count', 1 do
      post signup_path, params: { user:
                                      { name: "test",
                                        email: "mterada@gmail.com",
                                        password: "aaaaaa",
                                        password_confirmation: "aaaaaa",
                                        picture: picture } }
    end
    assert assigns(:user).picture?
    follow_redirect!
    follow_redirect!
    assert_match "test", response.body
  end
end
