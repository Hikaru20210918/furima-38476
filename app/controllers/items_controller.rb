class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:detail, :image, :item_name, :price, :category_id, :state_id, :area_id, :postage_id,
                                 :sipping_day_id).merge(user_id: current_user.id)
    # 学習メモ：.merge()内のカラム名は user_id 「id」の記述が必要
  end
end
