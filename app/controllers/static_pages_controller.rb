class StaticPagesController < ApplicationController
  
  # GET root_path
  def home
    redirect_to menu_path(1)
  end

end
