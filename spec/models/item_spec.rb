require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品が行える' do
      it 'item_name、price、delivery_charge_id、explanation、category_id、quality_id、shipping_origin_area_id、delivery_date_id、imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品が行えない' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end  
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end 
      it 'priceが全角では登録できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it 'priceは数字以外の値では登録できない' do
        @item.price = 'hoge'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it 'priceは定められた範囲外の値では登録できない' do
        @item.price = 12345678
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'priceは価格が300円未満では出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'priceは価格が9_999_999円を超えると出品できない' do
        @item.price = 12345678
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end 
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end 
      it 'category_idが空では登録できない' do
        @item.category_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end 
      it 'quality_idが空では登録できない' do
        @item.quality_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end 
      it 'shipping_origin_area_idが空では登録できない' do
        @item.shipping_origin_area_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin area can't be blank")
      end 
      it 'delivery_date_idが空では登録できない' do
        @item.delivery_date_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end 
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end 
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end 
    end
  end 
end   