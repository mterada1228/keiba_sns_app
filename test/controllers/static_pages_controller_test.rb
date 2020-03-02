require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @latest = menus(:latest)
    @middle = menus(:middle)
    @oldest = menus(:oldest)
  end

  test "本日に一番近い開催日のmenuページが取得できる（現在の日付より後の開催日がmenuにある時）" do
    @middle.destroy
    get root_url
    assert_equal assigns(:menu), @latest
  end
  
  test "本日に一番近い開催日のmenuページが取得できる（現在の日付より後の開催日がmenuにない時）" do
    @latest.destroy
    @middle.destroy
    get root_url
    assert_equal assigns(:menu), @oldest
  end

  test "rootページにアクセスするとmenu/showにリダイレクトされる事" do
    get root_url
    follow_redirect!
    assert_template 'menus/show'
  end

end
