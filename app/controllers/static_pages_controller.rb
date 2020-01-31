class StaticPagesController < ApplicationController
  
  # GET root_path
  def home
    # 現在の日時以降でもっとも近い開催日を持つMenuを返す
    # 上記がnilならば現在の日時からもっとも近い開催日を持つMenuを返す
    @menu = Menu.where("today_date >= ?",Time.zone.now).order("today_date ASC").first || 
            Menu.where("today_date <= ?",Time.zone.now).order("today_date DESC").first
    redirect_to menu_path(@menu)
  end

end
