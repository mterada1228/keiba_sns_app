class ReplyRelationshipsController < ApplicationController
  
  before_action :logged_in_user # ログイン済みかどうかを確認する
  
  # POST /reply_rerationships/id
  def create
    
    # ログインのチェック
    if current_user.nil?
      flash[:info] = "予想の投稿にはログインが必要です"
      redirect_to login_path
      return
    end

    # リプライを受けるマイクロポスト
    replied_micropost = Micropost.find(params[:id])

    # リプライするマイクロポスト
    reply_micropost = current_user.microposts.build()
    reply_micropost.race_id = replied_micropost.race_id
    reply_micropost.save
    
    # リプライ関係を生成する
    replied_micropost.replied(reply_micropost)
    
    redirect_to detail_microposts_path(replied_micropost)
    
  end
  
end
