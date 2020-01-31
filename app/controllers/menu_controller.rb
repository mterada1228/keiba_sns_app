class MenuController < ApplicationController

  # GET /menu/id
  def show
    # TODO 最新のidからmenuを取得する
    @menu = Menu.find(params[:id])
  end

end
