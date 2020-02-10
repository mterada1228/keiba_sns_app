class MicropostsController < ApplicationController
  
  # GET /micropost/id
  # TODO テストを記す
  def show
    @micropost = Micropost.find(params[:id])
  end
  
  # POST /micropost
  # TODO テストを記す
  def create
    
    @micropost = current_user.microposts.build()
    @micropost.race_id = params[:race_id]
    
    if current_user.nil?
      flash[:info] = "予想の投稿にはログインが必要です"
      redirect_to signup_path
    end

    if @micropost.save
      # マイクロポストのshowページに遷移する
      redirect_to micropost_path(@micropost)
    else
      redirect_to root_url
    end

  end
  
  private

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
