module SessionsHelper
  
  # ログインを行う
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # ログイン中のユーザ情報を返す
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    end
  end
  
  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
  
  # ログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
