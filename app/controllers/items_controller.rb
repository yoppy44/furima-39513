class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]

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
    @user = @item.user
  end  

  def edit
    if @item.purchase.present?
      redirect_to root_path  
    else  
      if current_user.id == @item.user_id  
        render :edit
      else 
        redirect_to root_path
      end  
    end
  end  
  
  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end  

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id
      item.destroy
    end
    redirect_to root_path
  end  

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :delivery_charge_id, :explanation, :category_id, :quality_id, :shipping_origin_area_id, :delivery_date_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end

