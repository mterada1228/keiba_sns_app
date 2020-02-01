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

end
