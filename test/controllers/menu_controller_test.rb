require 'test_helper'

class MenuControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @latest = menus(:latest)
    @middle = menus(:middle)
    @oldest = menus(:oldest)
  end
  
  # 場名を入れない場合でもデフォルトのレースが取得できる事
  test "場名の入力なしでレースが取得できる事" do
    get menu_path(@latest)
    assert_response :success
  end
  
  # 場名を入力して想定通りのレースが取得できる事
  test "場名を入力してレースが取得できる事" do
    get menu_path(@latest, course_name: "京都", round: 1)
    assert_response :success
    assert_equal 3, assigns(:races).count
  end
  
end
