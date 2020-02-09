require 'test_helper'

class ModeChangeTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end
  
  test '投稿モード切り替えのテスト' do
    
    # micropost閲覧モード
    get root_url
    follow_redirect!
    assert_template 'menu/_mode_feeding'
    
    # micropost投稿モード
    log_in_as(@user)
    get change_path
    follow_redirect!
    follow_redirect!
    assert_template 'menu/_mode_posting'
    assert_select "table"
    
  end
end
