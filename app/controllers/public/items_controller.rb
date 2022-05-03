class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @items = Item.find(params[:id])
    @cart_item = CartItem.new(item_id: @items.id)
  end

  def create
    binding.pry
  end

private
  def item_params
		params.require(:item).permit(:image_id, :name, :introduction)
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
