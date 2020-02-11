class KaimesController < ApplicationController

  # POST /kaimes
  # TODO テストを書く
  def create
    
    @kaime = Kaime.new(kaime_params)
    @kaime.micropost_id = params[:micropost_id]
    @kaime.baken_type = params[:baken_type]
    @kaime.buy_type = params[:buy_type]
    
    @micropost = Micropost.find(params[:micropost_id])
    
    if @kaime.save
      # マイクロポストのshowページに遷移する
      redirect_to micropost_path(@micropost)
    else
      redirect_to root_url
    end

  end

  def delete
  end
  
  private
    
    def kaime_params
      params.require(:kaime).permit(:id,
                                    :baken_type,
                                    :buy_type,
                                    :first_hoses,
                                    :second_hoses,
                                    :third_hoses,
                                    :betting)
    end

end