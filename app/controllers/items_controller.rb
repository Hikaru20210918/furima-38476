class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item , only:["show","edit","update","destroy"]
  def index
    @item = Item.all.order(id: "DESC")
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

  def show
  end

  def edit
    if @item.purchase.present?
      redirect_to root_path
    else
      if @item.user != current_user
        redirect_to action: :index
      end
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path 
    else
      render :edit 
    end
  end

  def destroy
    if @item.user == current_user
      @item.destroy
    end
    redirect_to root_path
  end



  private

  def set_item
    @item = Item.find(params[:id])
  end


  def item_params
    params.require(:item).permit(:detail, :image, :item_name, :price, :category_id, :states_id, :area_id, :postage_id,:sipping_day_id).merge(user_id: current_user.id)
    # 学習メモ：.merge()内のカラム名は user_id の「_id」記述が必要
  end
end


