class UsersController < ApplicationController
  
  # アクションの実行前にログイン状態かどうか確認する
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy, :following, :followers]
  
  # GET /users/new (/signup)
  def new
    @user = User.new
  end
  
  # GET /users
  def index
    @users = User.paginate(page: params[:page]).search(params[:search])
  end
  
  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      # TODO 一つ前にいたページに戻れるようにする
      log_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  # GET /users/id
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.where(activated: true).paginate(page: params[:page])
  end
  
  # PATCH /users/id
  def update
    @user = User.find(params[:id])
    if current_user?(@user)
      @user.update_attributes(user_params)
      flash[:info] = "会員情報を変更しました"
      redirect_to user_path(@user)
    else
      redirect_to root_url
    end
  end
  
  # GET /users/id/following
  def following
    @title = "フォロー中"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  # GET /users/id/followers
  def followers
    @title = "フォロワー"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  private
  
    # Userのstrong parameter(form入力可能なパラメータを定義)
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :picture)
    end
  
end
