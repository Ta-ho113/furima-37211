class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.new(buyer_params)
    if @buyer.valid?
      @buyer.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def buyer_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :home_num, :building_name, :tel).merge(user_id: current_user.id)
  end

end