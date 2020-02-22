class MicropostsController < ApplicationController
  
  # update時のみ、投稿が空出ないか確認する
  before_action :content_check, only: [:update]
  
  # GET /micropost/id
  def show
    @micropost = Micropost.find(params[:id])
    @micropost.build_hosemark
    @kaimes = @micropost.kaimes
    @kaime = Kaime.new
    @hoses = create_hose_table(@micropost.race)
  end
  
  # POST /micropost
  def create
    
    if current_user.nil?
      flash[:info] = "予想の投稿にはログインが必要です"
      redirect_to login_path
      return
    end
    
    @micropost = current_user.microposts.build()
    @micropost.race_id = params[:race_id]
    
    if @micropost.save
      # マイクロポストのshowページに遷移する
      redirect_to micropost_path(@micropost)
    else
      redirect_to root_url
    end

  end
  
  # PATCH /microposts/id
  def update
    
    @micropost = Micropost.find(params[:id])
    @micropost.update_attributes(micropost_params)
    
    # editが押下されたらactivatedをtrueに変更する。
    @micropost.update(activated: true)
    
    # 投稿したレースのmenuページに遷移する。
    race = @micropost.race
    menu = race.menu
    redirect_to menu_path(menu, course_name: race.place, round: race.round)

  end
  
  # GET /microposts/id/detail
  def detail
    @micropost = Micropost.find(params[:id])
    @microposts = @micropost.reply_posts
    render 'show_detail'
  end
  
  # GET /microposts/id/reply
  def reply
    
    if current_user.nil?
      flash[:info] = "投稿にはログインが必要です"
      redirect_to login_path
      return
    end

    @micropost = Micropost.find(params[:id])
    render 'reply'
  end
  
  private
  
    # 正しいユーザーかどうか確認
    def content_check
      if params[:micropost][:content].blank?
        @micropost = Micropost.find(params[:id])
        flash[:danger] = "投稿にはコメントの入力が必要です"
        redirect_to(micropost_path(@micropost))
      end
    end

    # strong parameter
    def micropost_params
      params.require(:micropost).permit(:content,
                                      :race_id,
                                      hosemark_attributes:[:id, 
                                      :hose1_mark,
                                      :hose2_mark,
                                      :hose3_mark,
                                      :hose4_mark,
                                      :hose5_mark,
                                      :hose6_mark,
                                      :hose7_mark,
                                      :hose8_mark,
                                      :hose9_mark,
                                      :hose10_mark,
                                      :hose11_mark,
                                      :hose12_mark,
                                      :hose13_mark,
                                      :hose14_mark,
                                      :hose15_mark,
                                      :hose16_mark,
                                      :hose17_mark,
                                      :hose18_mark])
    end

end
