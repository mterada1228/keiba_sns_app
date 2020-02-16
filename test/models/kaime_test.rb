require 'test_helper'

class KaimeTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build()
    @micropost.race_id = races(:race_1).id
    @micropost.save
    @micropost.reload
  end
  
  test '買い目が１つも存在しない場合永続化されない事をテスト' do
    @kaime = @micropost.kaimes.build(baken_type: "三連複",
                                      buy_type: "ながし",
                                      first_hoses: '1',
                                      second_hoses: '2',
                                      third_hoses: [1, 2])
    assert_no_difference 'Kaime.count' do
      @kaime.save
    end
  end
  
end
