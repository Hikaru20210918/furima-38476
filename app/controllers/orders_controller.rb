class OrdersController < ApplicationController
  
  before_action :authenticate_user!, except: [:index ]
 
  def index 
    unless user_signed_in?
      redirect_to  '/users/sign_in'
      else
        @item = Item.find(params[:item_id])
      if @item.purchase.present?
          redirect_to root_path
        else
          @order_address = OrderAddress.new
        if @item.user == current_user
          redirect_to items_path
        end
      end
    end
  end

  def create
    @item = Item.find(params[:item_id])
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
