require 'rails_helper'

RSpec.describe PurchaseRecipient, type: :model do
  describe '商品購入画面' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_recipient = FactoryBot.build(:purchase_recipient, user_id: user.id, item_id: item.id)
    end

    context '商品購入ができる時' do
      it 'token、post_cord、shipping_origin_area_id、municipalities、address、building_name、telephone_number、purchase_idが存在すれば購入できる' do
        expect(@purchase_recipient).to be_valid
      end
    end
    context '商品購入ができない時' do
      it "tokenが空では登録できないこと" do
        @purchase_recipient.token = nil
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと購入できない' do
        @purchase_recipient.post_cord = ''
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Post cord can't be blank")
      end  
      it '郵便番号はハイフンを入れなければならない' do
        @purchase_recipient.post_cord = '1234567'
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Post cord is invalid. Enter it as follows (e.g. 123-4567)")
      end  
      it '郵便番号は”数字3桁-数字4桁”でなければならない' do
        @purchase_recipient.post_cord = '1234-567'
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Post cord is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県が空だと購入できない' do
        @purchase_recipient.shipping_origin_area_id = 1
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Shipping origin area can't be blank")
      end  
      it '市区町村が空だと購入できない' do
        @purchase_recipient.municipalities = ''
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Municipalities can't be blank")
      end  
      it '番地が空だと購入できない' do
        @purchase_recipient.address = ''
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Address can't be blank")
      end  
      it '電話番号が空だと購入できない' do
        @purchase_recipient.telephone_number = ''
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Telephone number can't be blank")
      end  
      it '電話番号は10桁～11桁でなければ登録できない' do
        @purchase_recipient.telephone_number = '090123456'
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Telephone number is too short")
      end  
      it '電話番号は全角では登録できない' do
        @purchase_recipient.telephone_number = '０１２３４５６７８９０'
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Telephone number is invalid. Input only number")
      end  
      it '電話番号は数字以外の値では登録できない' do
        @purchase_recipient.telephone_number = 'hoge'
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Telephone number is invalid. Input only number")
      end  
      it 'userが紐付いていないと保存できないこと' do
        @purchase_recipient.user_id = nil
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_recipient.item_id = nil
        @purchase_recipient.valid?
        expect(@purchase_recipient.errors.full_messages).to include("Item can't be blank")
      end
    end 
  end   
end
