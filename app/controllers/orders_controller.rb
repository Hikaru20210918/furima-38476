class OrdersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_item

  def index 
    if @item.purchase.present?
      redirect_to root_path
      else
        @order_address = OrderAddress.new
      if @item.user == current_user
          redirect_to items_path
      end
    end
  end
  

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end



  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postcode,:area_id,:municipalities,:address,:building,:phone_number).merge(token: params[:token],user_id: current_user.id,item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end


end
