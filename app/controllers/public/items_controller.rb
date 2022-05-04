class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @items = Item.find(params[:id])
    @cart_item = CartItem.new(item_id: @items.id)
  end

private
  def item_params
		params.require(:item).permit(:image_id, :name, :introduction)
  end
end
