require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の出品' do
    context '出品できる場合' do
      it '全ての値が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'detailが空では登録できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Detail can't be blank"
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'postage_idが空では登録できない' do
        @item.postage_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage can't be blank"
      end
      it 'category_idが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'state_idが空では登録できない' do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "State can't be blank"
      end
      it 'area_idが空では登録できない' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it 'sipping_day_idが空では登録できない' do
        @item.sipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Sipping day can't be blank"
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
