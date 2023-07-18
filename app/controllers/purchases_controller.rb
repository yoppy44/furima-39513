class PurchasesController < ApplicationController

  def index
  end  

  def new
    @purchase_recipient = PurchaseRecipient.new
  end  

  def create
    @purchase_recipient = PurchaseRecipient.new(purchase_params)
    if @purchase_recipient.valid?
      @purchase_recipient.save
      redirect_to root_path
    else  
      render :new, status: :unprocessable_entity
    end  
  end  

  private

  def purchase_params
    params.require(:purchase_recipient).permit(:post_cord, :prefecture_id, :municipalities, :address, :building_name, :telephone_number, :purchase).merge(user: current_user.id, item: current_item_id)
  end  

end
