class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @buyers_order = BuyersOrder.new
  end

  def create
    @buyers_order = BuyersOrder.new(order_params)
    if @buyers_order.valid?
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

  def order_params
    params.require(:buyers_order).permit(:post_number, :region_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end

end