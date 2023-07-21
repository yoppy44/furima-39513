class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    if current_user.id == @item.user_id
      redirect_to root_path
    else
      unless @item.purchase.present? 
        @purchase_recipient = PurchaseRecipient.new
      else
        redirect_to root_path
      end
    end  
  end  

  def create
    @purchase_recipient = PurchaseRecipient.new(purchase_params)
    if @purchase_recipient.valid?
      pay_item
      @purchase_recipient.save
      redirect_to root_path
    else  
      render :index, status: :unprocessable_entity
    end  
  end  

  private 

  def purchase_params
    params.require(:purchase_recipient).permit(:post_cord, :shipping_origin_area_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end  

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],    
        currency: 'jpy'                 
      )
    end    

    def set_item
      @item = Item.find(params[:item_id])
    end  

end
