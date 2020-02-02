require 'test_helper'

class MenuShowTest < ActionDispatch::IntegrationTest
  
  def setup
    @latest = menus(:latest)
    @middle = menus(:middle)
    @oldest = menus(:oldest)
  end
  
  test "ヘッダーが予想通りである事" do
    get menu_path(@latest)
    assert_select "a[href=?]", root_path
    # TODO 会員登録、会員検索を実装したらテストを書く
  end
  
  test "開催日エリアのテスト" do
    get menu_path(@middle)
    # TODO カレンダを実装したらテストを書く
    assert_select "a[href=?]", menu_path(@oldest)
    assert_select "a[href=?]", menu_path(@latest)
  end
  
  test "raundエリアのテスト" do
    get menu_path(@middle)
    assert_select "div#race_round"
  end
  
  test "race情報エリアのテスト" do
    get menu_path(@middle, "東京", 1)
    assert_match @middle.races.first.race_name, response.body
    assert_match @middle.races.first.cource_type, response.body
    assert_match @middle.races.first.cource_length.to_s, response.body
  end

end
