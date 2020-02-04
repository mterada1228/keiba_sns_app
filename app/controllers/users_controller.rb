class UsersController < ApplicationController
  
  # GET /users/new (/signup)
  def new
    @user = User.new
  end
  
  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
    else
      render 'new'
    end
  end
  
  # GET /users/id
  def show
  end
  
  private
  
    # Userのstrong parameter(form入力可能なパラメータを定義)
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
  
end
