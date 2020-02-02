class UsersController < ApplicationController
  
  # GET /users/new (/signup)
  def new
    @user = User.new
  end
  
end
