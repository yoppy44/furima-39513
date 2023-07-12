class ItemsController < ApplicationController

  def index
  end  

  private

  def item_params
    params.require(:image).permit(:item_name, :price, :delivery_charge_id, :explanation, :category_id, :quality_id, :shipping_origin_area_id, :delivery_date_id, :image).merge(user_id: current_user.id)
  end

end
