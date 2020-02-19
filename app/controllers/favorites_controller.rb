class FavoritesController < ApplicationController
  
  before_action :logged_in_user # ログイン済みかどうかを確認する

  # POST /favorites   
  def create
    
    @micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(@micropost)
    @micropost.reload
    
    # お気に入りしたMicropostのMenuページに遷移する
    race = @micropost.race
    menu = race.menu
    
    respond_to do |format|
      format.html { redirect_to menu_path(menu, course_name: race.place, round: race.round) }
      format.js
    end
    
  end

  # DELETE /favorites
  def destroy

    @micropost = Favorite.find(params[:id]).micropost
    current_user.unfavorite(@micropost)
    @micropost.reload
    
    # お気に入りしたMicropostのMenuページに遷移する
    race = @micropost.race
    menu = race.menu
    
    respond_to do |format|
      format.html { redirect_to menu_path(menu, course_name: race.place, round: race.round) }
      format.js
    end

  end

end
