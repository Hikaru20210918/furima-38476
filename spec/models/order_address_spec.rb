require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id:item.id)
  end
  describe '商品の購入' do
    context '購入できる場合' do
      it '全ての値が存在すれば購入できる' do  
      expect(@order_address).to be_valid
      end
    end

    context '購入できない場合' do
      it '郵便番号が空では購入できない' do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postcode can't be blank"
      end
      it '郵便番号が「3桁ハイフン4桁」でないと購入できない' do
        @order_address.postcode = '00000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postcode is invalid"
      end
      it '郵便番号が全角では購入できない' do
        @order_address.postcode = '０００−００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postcode is invalid"
      end
      it '都道府県が未選択項目（id:1）では購入できない' do
        @order_address.area_id = '0'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Area must be other than 0"
      end
      it '市区町村が空では購入できない' do
        @order_address.municipalities= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Municipalities can't be blank"
      end
      it '番地が空では購入できない' do
        @order_address.address= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Address can't be blank"
      end
      it '電話番号が空では購入できない' do
        @order_address.phone_number= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it '電話番号が9桁以下では購入できない' do
        @order_address.phone_number= '000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is too short (minimum is 10 characters)"
      end
      it '電話番号が12桁以上では購入できない' do
        @order_address.phone_number= '000000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is too long (maximum is 11 characters)"
      end
      it 'user_idが空では購入できない' do
        @order_address.user_id= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空では購入できない' do
        @order_address.item_id= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
      it 'クレジットカード情報が空では購入できない' do
        @order_address.token= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end