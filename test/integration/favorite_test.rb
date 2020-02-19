require 'test_helper'

class FavoriteTest < ActionDispatch::IntegrationTest

  def setup
    @user  = users(:test1)
    @micropost = microposts(:one)
    log_in_as(@user)
  end

  test "投稿のお気に入りができる事" do
    assert_difference '@user.favorite_microposts.count', 1 do
      post favorites_path, params: { micropost_id: @micropost.id }
    end
  end

  test "投稿のお気に入りができる事(Ajax)" do
    assert_difference '@user.favorite_microposts.count', 1 do
      post favorites_path, xhr: true, params: { micropost_id: @micropost.id }
    end
  end

  test "お気に入り解除ができること" do
    @user.favorite(@micropost)
    favorites = @user.favorites.find_by(micropost_id: @micropost.id)
    assert_difference '@user.favorite_microposts.count', -1 do
      delete favorite_path(favorites)
    end
  end

  test "お気に入り解除ができること(Ajax)" do
    @user.favorite(@micropost)
    favorites = @user.favorites.find_by(micropost_id: @micropost.id)
    assert_difference '@user.favorite_microposts.count', -1 do
      delete favorite_path(favorites), xhr: true
    end
  end

end
