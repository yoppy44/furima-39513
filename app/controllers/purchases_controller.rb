class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_recipient = PurchaseRecipient.new
  end  

  def create
    @purchase_recipient = PurchaseRecipient.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase_recipient.valid?
      @purchase_recipient.save
      redirect_to root_path
    else  
      render :index, status: :unprocessable_entity
    end  
  end  

  private 

  def purchase_params
    params.require(:purchase_recipient).permit(:post_cord, :shipping_origin_area_id, :municipalities, :address, :building_name, :telephone_number, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end  

end
