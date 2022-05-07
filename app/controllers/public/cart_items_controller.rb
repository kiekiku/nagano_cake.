class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
     redirect_to cart_items_path
  end

  def subtotal
    item.with_tax_price * amount
  end

  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart = current_cart
    @cart_items.destroy
     redirect_to cart_items_path
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to items_path, notice: 'カートが空になりました。' }
      format.json { head :no_content }
    end
  end


  private
    def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :image)
    end
end
