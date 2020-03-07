class SessionsController < ApplicationController
  
  # GET /login
  def new
    # ポートフォリオ用
    flash.now[:info] = "サンプルユーザとしてこちらでログインできます。
    メールアドレス：mterada1228@gmail.com、
    パスワード：aaaaaa"
    render 'new'
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
  
  # DELETE /logout
  def destroy
    log_out if logged_in? # session インスタンスを破棄する
    redirect_to root_url
  end

end
