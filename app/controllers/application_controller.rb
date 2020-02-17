class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # includeする事で全コントローラーから呼び出せる
  include SessionsHelper
  include MicropostsHelper
  include MenuHelper
  
  # ユーザーのログインを確認する
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "このサービスの利用にはログインが必要です"
      redirect_to login_url
    end
  end

end
