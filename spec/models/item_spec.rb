require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の出品' do
    context '出品できる場合' do
      it '全ての値が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'price価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end
      it 'priceが300円未満では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it 'priceが9999999円を超えると出品できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it 'detailが空では出品できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Detail can't be blank"
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'postage_idが未選択項目（id:1）では出品できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage must be other than 1"
      end
      it 'category_idが未選択項目（id:1）では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it 'states_idが未選択項目（id:1）では出品できない' do
        @item.states_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "States must be other than 1"
      end
      it 'area_idがが未選択項目（id:0）では出品できない' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Area must be other than 0"
      end
      it 'sipping_day_idが未選択項目（id:1）では出品できない' do
        @item.sipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Sipping day must be other than 1"
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
