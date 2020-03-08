class AdminsController < ApplicationController

    def index
        
        if !current_user.admin?
            flash[:denger] = "本ページは管理者以外アクセスできません"
            redirect_to login_path
        end

    end

end
