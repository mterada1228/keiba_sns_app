ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
    # テストユーザーがログイン中の場合にtrueを返す（テストmethodはapp/helper/*を呼び出せないので改めて定義）
  def is_logged_in?
    !session[:user_id].nil?
  end
  
  # テストユーザーとしてログインする
  def log_in_as(user)
    session[:user_id] = user.id
  end
  
  # テストユーザーとしてログインする
  def log_in_as(user, password: 'password')
    post login_path, params: { session: { email: user.email,
                                          password: password} }
  end

end
