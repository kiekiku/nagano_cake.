class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
    if params[:day]
      @orders = Order.created_at
    else
  	   @orders = Order.all.page(params[:page])
    end
  end

  def show
  	@order = Order.find(params[:id])
    @order_details = @order.order_details
    @customer = @order.customer
  end

  def update

  	@order = Order.find(params[:id])
    @order.update(order_params)
    flash[:success] = "更新に成功しました"
  	redirect_to admin_root_path
  end

  private
  def order_params
  	params.require(:order).permit(:postal_code, :addresses, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
