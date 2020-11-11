class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    authenticate_user!
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
    params.require(:item).permit(:name, :category_id, :status_id, :price, :payment_id, :area_id, :send_day_id, :explanation, :image).merge(user_id: current_user.id)
  end
end
