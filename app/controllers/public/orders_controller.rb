class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @cart_item = current_customer.cart_items
    @customer = current_customer
    @order = Order.new(order_params)
    if params[:order][:payment] == "クレジットカード"
      @order.payment_method  = 0
    elsif params[:order][:payment] == "銀行振込"
      @order.payment_method = 1
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save!
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
    @order_detail = OrderDetail.new(price: cart_item.item.price,amount: cart_item.amount,making_status: 0,order_id: @order.id,item_id: cart_item.item_id)
    @order_detail.save
    end
    @cart_items.destroy_all
     redirect_to orders_conplete_path
  end

  def index
    @orders = current_customer.orders.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
  end



  private
    def order_params
    params.require(:order).permit(:postal_code, :addresses, :name, :shipping_cost, :payment_method, :status, :total_payment)
    end
end
