class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :ensure_current_user
  def index
    @buyers_order = BuyersOrder.new
  end

  def create
    @buyers_order = BuyersOrder.new(order_params)
    if @buyers_order.valid?
      pay_item
      @buyers_order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def ensure_current_user
    if current_user.id == @item.user_id || @item.order
      redirect_to root_path
    end
  end

  def order_params
    params.require(:buyers_order).permit(:post_number, :region_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end