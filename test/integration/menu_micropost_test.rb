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
    
    # 買い目を選択すると保存が成功し、マイクロポスト画面に表示される事
    micropost_id = assigns(:micropost).id
    baken_type = "馬連"
    buy_type = "ながし"
    post kaimes_path, params: { kaime: {first_hoses: "1",
                                        second_hoses: "2",
                                        betting: 300},
                                micropost_id: micropost_id,
                                baken_type: baken_type,
                                buy_type: buy_type }
    follow_redirect!
    assert_match '馬連 ながし : 1 - 2 300円', response.body

  end

end