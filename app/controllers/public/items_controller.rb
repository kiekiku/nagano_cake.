class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: true)
  end

  def show
    @items = Item.find(params[:id])
    @cart_item = CartItem.new
  end

private
  def item_params
		params.require(:item).permit(:image_id, :name, :introduction)
  end
end
