class MenuController < ApplicationController

  # GET /menu/id
  def show
    @menu = Menu.find(params[:id])
    if params[:course_name] && params[:round]
      @races = @menu.today_selected_course_race(params[:course_name])
      @race = @menu.get_race(@races.first.place, params[:round])
    else
      @races = @menu.today_selected_course_race(@menu.today_course[0])
      @race = @menu.get_race(@races.first.place, 1)
    end
  end

end
