class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # includeする事で全コントローラーから呼び出せる
  include SessionsHelper
  include MicropostsHelper

end
