require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @micropost = assign(:micropost_hitting)
  end

  test '買い目の的中ステータス更新のテスト' do
    get update_hitting_admins
    # 単勝 hit

  end

end
