class FavoritesController < ApplicationController
  
  before_action :logged_in_user # ログイン済みかどうかを確認する

  # POST /fovorites   
  def create
    
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    
    # お気に入りしたMicropostのMenuページに遷移する
    race = micropost.race
    menu = race.menu
    redirect_to menu_path(menu, course_name: race.place, round: race.round)
    
  end

  # DELETE /fovorites
  def destroy

    micropost = Favorite.find(params[:id]).micropost
    current_user.unfavorite(micropost)
    
    # お気に入りしたMicropostのMenuページに遷移する
    race = micropost.race
    menu = race.menu
    redirect_to menu_path(menu, course_name: race.place, round: race.round)

  end

end
