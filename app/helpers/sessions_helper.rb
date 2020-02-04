module SessionsHelper
  
  # ログインを行う
  def log_in(user)
    session[:user_id] = user.id
  end
  
end
