class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect action: :index
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal, :area_id, :municipalities, :building_name, :block, :tell_num).merge(user_id: current_user.id)
  end
end
