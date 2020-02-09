class MicropostsController < ApplicationController
  
  # POST /micropost
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿に成功しました"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end
  
  private

  # strong parameter
  def micropost_params
    params.require(:micropost).permit(:content, 
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
