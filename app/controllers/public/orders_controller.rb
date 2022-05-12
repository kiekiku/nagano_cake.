class Public::OrdersController < ApplicationController
  def new
    @order = Order.all
    @addresses = current_customer.addresses
  end

  def confirm
    @items = Order.all
    @order = current_customer
  end

  def index

  end

  def show
  end

  private
    def order_params
    params.require(:order).permit(:postal_code, :addresses, :name, :shipping_cost, :payment_method, :status)
    end
end
