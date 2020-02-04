class SessionsController < ApplicationController
  
  # GET /login
  def new
  end
  
  # POST /login
  def create
    # formに入力されたemailでUserを検索する
    @user = User.find_by(email: params[:session][:email].downcase)
    # Userの存在性 & パスワードの一致を確認する
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to root_path
    else
      # flashだとリダイレクトしないと消滅しないが、flash.nowはrenderでも消滅する
      flash.now[:danger] = '登録されていないメールアドレス、またはパスワードが一致しません'
      render 'new'
    end
  end

end
