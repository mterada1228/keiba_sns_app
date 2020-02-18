class RelationshipsController < ApplicationController

  before_action :logged_in_user # ログイン済みかどうかを確認する

  # POST /users/id/relasionships
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user
  end

  # DELETE /users/id/relasionships
  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end

end
