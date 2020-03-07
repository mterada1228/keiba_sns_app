class KaimesController < ApplicationController

  # POST /kaimes/id
  def create
    
    @kaime = Kaime.new(kaime_params)
    @kaime.micropost_id = params[:micropost_id]
    @kaime.baken_type = params[:baken_type]
    @kaime.buy_type = params[:buy_type]
    
    @micropost = Micropost.find(params[:micropost_id])
    
    @kaime.save
    @micropost.reload

    respond_to do |format|
      format.html { redirect_to micropost_path(@micropost) }
      format.js
    end
  end

  # DELETE /kaime/id
  def destroy
    Kaime.find(params[:id]).destroy
    @micropost = Micropost.find(params[:micropost_id])
    @micropost.reload
    respond_to do |format|
      format.html { redirect_to micropost_path(@micropost) }
      format.js
    end
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