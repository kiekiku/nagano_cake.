class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @cart_item = current_customer.cart_items
    @customer = current_customer
    @address = Address.find(params[:order][:address_id])
    @order = Order.new(order_params)
    if params[:order][:payment] == "クレジットカード"
      @order.payment_method  = 0
    elsif params[:order][:payment] == "銀行振込"
      @order.payment_method = 1
    end
    if params[:_add] == "customersAdd"
      @order.postal_code = @customer.postal_code
      @order.addresses = @customer.address
      @order.name = @customer.name
    end
    if params[:_add] == "shipAdds"
      @order.postal_code = @address.postal_code
      @order.addresses = @address.address
      @order.name = @address.name
    end
    if params[:_add] == "newAdd"
      @order.postal_code = params[:order][:postal_code]
      @order.addresses = params[:order][:address]
      @order.name = params[:order][:name]
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
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end



  private
    def order_params
    params.require(:order).permit(:postal_code, :addresses, :name, :shipping_cost, :payment_method, :status, :total_payment,:customer_id)
    end
end
