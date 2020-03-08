require 'test_helper'

class MenuShowTest < ActionDispatch::IntegrationTest
  
  def setup
    # menus
    @latest = menus(:latest)
    @middle = menus(:middle)
    @oldest = menus(:oldest)
    # users
    @user = users(:michael) 
  end

  test "ヘッダーが予想通りである事" do
    get menu_path(@latest)
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", users_path
  end
  
  test "開催日エリアのテスト" do
    get menu_path(@middle)
    assert_select "a[href=?]", menu_path(@oldest)
    assert_select "a[href=?]", menu_path(@latest)
  end
  
  test "roundエリアのテスト" do
    get menu_path(@middle)
    assert_select "div#race_round"
  end
  
  test "race情報エリアのテスト" do
    get menu_path(@middle, "東京", 1)
    assert_match @middle.races.first.race_name, response.body
    assert_match @middle.races.first.cource_type, response.body
    assert_match @middle.races.first.cource_length.to_s, response.body
  end

  test "マイクロポスト表示のテスト" do
    
  end

end
