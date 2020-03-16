class AdminsController < ApplicationController

    # GET /admins
    def index
        if !current_user.admin?
            flash[:denger] = "本ページは管理者以外アクセスできません"
            redirect_to login_path
        end
    end

    # GET /admins/update_hitting
    def update_hitting
        
        # 的中した買い目
        Race.all.each do |race|
            race.microposts.each do |microposts|
                microposts.kaimes.each do |kaime|
                    kaime.update_attributes(hitting: check_hitting(race, kaime))
            end
        end

        flash[:info] = "マイクロポストの的中ステータスが更新されました"
        redirect_to admins_path
    end

    private 
    
        #  買い目が的中しているかどうかを判定する
        def check_hitting(race, kaime)
            
            if kaime.baken_type == "単勝"
                return true if kaime.first_hoses == race.first_hose_num
            end

            if kaime.baken_type == "複勝"
                return true if kaime.first_hoses.in?([race.first_hose_num,
                                                        race.second_hose_num, 
                                                        race.third_hose_num])
            end
            
            if kaime.baken_type == "馬連"
                kaime.first_hoses.first_hoses.split(',').each do |first_hose|
                    if first_hose.in?([race.first_hose_num, race.second_hose_num])
                        kaime.second_hoses.split(',').each do |second_hose|
                            return true if second_hose.in?([race.first_hose_num, race.second_hose_num])
                        end
                    end
                end
            end

            if kaime.baken_type == "馬単"
                return true if race.first_hose_num.in?(kaime.first_hoses.split(',')) 
                                && race.second_hose_num.in?(kaime.second_hoses.sprit(',')) 
            end

            if kaime.baken_type == "ワイド"
                kaime.first_hoses.first_hoses.split(',').each do |first_hose|
                    if first_hose.in?([race.first_hose_num, race.second_hose_num, race.third_hose_num])
                        kaime.second_hoses.split(',').each do |second_hose|
                            return true if second_hose.in?([race.first_hose_num, race.second_hose_num, race.third_hose_num])
                        end
                    end
                end
            end

            if kaime.baken_type == "三連複"
                kaime.first_hoses.first_hoses.split(',').each do |first_hose|
                    if first_hose.in?([race.first_hose_num, race.second_hose_num, race.third_hose_num])
                        kaime.second_hoses.split(',').each do |second_hose|
                            if second_hose.in?([race.first_hose_num, race.second_hose_num, race.third_hose_num])
                                kaime.third_hoses.split(',').each do |thrid_hose|
                                    return true if thrid_hose.in?([race.first_hose_num, race.second_hose_num, race.third_hose_num])
                                end
                            end
                        end
                    end
                end
            end

            if kaime.baken_type == "三連単"
                return true if race.first_hose_num.in?(kaime.first_hoses.split(',')) 
                                && race.second_hose_num.in?(kaime.second_hoses.sprit(',')) 
                                && race.third_hose_num.in?(kaime.third_hoses.sprit(',')) 
            end
            
        end

end
