class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC")
  end  

  def new
    @item = Item.new
  end  

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end  

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :delivery_charge_id, :explanation, :category_id, :quality_id, :shipping_origin_area_id, :delivery_date_id, :image).merge(user_id: current_user.id)
  end

end
