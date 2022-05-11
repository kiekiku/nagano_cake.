class Public::OrdersController < ApplicationController
  def new
    @order = Order.find(params[:id])
  end

  def index
    
  end

  def show
  end
end
