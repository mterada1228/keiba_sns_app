class KaimesController < ApplicationController

  # POST /kaimes
  def create
    
    @kaime = Kaime.new(kaime_params)
    @kaime.micropost_id = params[:micropost_id]
    @kaime.baken_type = params[:baken_type]
    @kaime.buy_type = params[:buy_type]
    
    @micropost = Micropost.find(params[:micropost_id])
    
    @kaime.save
    redirect_to micropost_path(@micropost)

  end

  def delete
  end
  
  private
    
    def kaime_params
      params.require(:kaime).permit(:baken_type,
                                    :buy_type,
                                    :betting,
                                    :first_hoses,
                                    :second_hoses,
                                    first_hoses: [],
                                    second_hoses: [],
                                    third_hoses: [])
    end

end