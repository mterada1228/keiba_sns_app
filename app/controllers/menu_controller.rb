class MenuController < ApplicationController

  # GET /menu/id
  def show
    @menu = Menu.find(params[:id])
  end

end
