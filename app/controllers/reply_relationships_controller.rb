class ReplyRelationshipsController < ApplicationController
  
  before_action :logged_in_user
  
  # POST /reply_rerationships/id
  def create
    
    # ログインのチェック
    if current_user.nil?
      flash[:info] = "投稿にはログインが必要です"
      redirect_to login_path
      return
    end

    # リプライを受けるマイクロポスト
    replied_micropost = Micropost.find(params[:replied_micropost_id])

    # リプライするマイクロポスト
    reply_micropost = current_user.microposts.build()
    reply_micropost.race_id = replied_micropost.race_id
    reply_micropost.content = params[:reply_relationship][:content]
    reply_micropost.save
    
    # リプライ関係を生成する
    replied_micropost.replied(reply_micropost)
    
    redirect_to detail_micropost_path(replied_micropost)
    
  end
  
end
