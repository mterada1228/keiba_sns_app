require 'test_helper'

class MenuTest < ActiveSupport::TestCase
  
  def setup
    @latest = menus(:latest)
    @middle = menus(:middle)
    @oldest = menus(:oldest)
  end

  # previousのテスト
  test "previousが開催日順の一つ前の日付を返す" do
    assert_equal @middle.previous, @oldest
  end
  
  # nextのテスト
  test "nextが開催日順の一つ後の日付を返すかテスト" do
    assert_equal @middle.next, @latest
  end
  
  # today_courceのテスト
  test "today_courseが場所名を取得できるかテスト" do
    races = @latest.today_course
    assert_equal 2, races.count
  end
  
  # today_selected_course_raceのテスト
  test "today_selected_course_raceがレースを取得できるかテスト" do
    races_tokyo = @latest.today_selected_course_race("東京")
    assert_equal 2, races_tokyo.count
    races = @latest.today_selected_course_race("京都")
    assert_equal 3, races.count
  end

end
