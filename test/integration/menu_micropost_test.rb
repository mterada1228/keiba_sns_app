require 'test_helper'

class MenuMicropostTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @race = races(:race_1)
  end
  
  test 'マイクロポスト投稿のテスト' do
    
    # 非ログイン状態でログイン画面に遷移する事
    post microposts_path, params: { micropost: {race_id: @race.id} }
    follow_redirect!
    assert_template 'sessions/new'
    assert_not flash.empty?
    
    # ログイン状態であれば投稿画面に遷移できる事
    log_in_as(@user)
    post microposts_path, params: { race_id: @race.id }
    follow_redirect!
    assert_template 'microposts/show'
    assert flash.empty?

  end

end
