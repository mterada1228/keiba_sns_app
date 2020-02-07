class ModeChangeController < ApplicationController
  
  # GET /change
  def new
    mode_micropost
    redirect_to root_url
  end

end
