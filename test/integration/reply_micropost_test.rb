require 'test_helper'

class ReplyMicropostTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:test1)
    @replied_micropost = microposts(:one)
  end
  
  test 'リプライ実施のテスト' do
    
    # ログインしてない場合
    get reply_micropost_path(@replied_micropost)
    follow_redirect!
    assert_template 'sessions/new'
    
    # 投稿に成功する
    log_in_as(@user)
    
    get reply_micropost_path(@replied_micropost)
    assert_template 'microposts/reply'
    
    assert_difference '@replied_micropost.reply_posts.count', 1 do
      post reply_relationships_path, params: {replied_micropost_id: @replied_micropost.id,
                                              reply_relationship: {content: "テストコメント"} }
    end
    
    follow_redirect!
    assert_template 'microposts/show_detail'
    assert_select "div#micropost-#{@replied_micropost.id}"
    
  end
  
end
