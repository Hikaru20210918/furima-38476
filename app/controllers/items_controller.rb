class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index ]
  
  def index
    
  end

  def new 
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
  end

  private

  def prototype_params
    params.require(:item).permit(:image,:item_name,:price,:category_id,:state_id,:area_id,:postage_id,:sipping_day_id)
  end
end
end
