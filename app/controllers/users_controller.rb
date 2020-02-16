class UsersController < ApplicationController
  
  # GET /users/new (/signup)
  def new
    @user = User.new
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
  
  private
  
    # Userのstrong parameter(form入力可能なパラメータを定義)
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :picture)
    end
  
end
