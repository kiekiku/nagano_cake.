# frozen_string_literal: true

class Public::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
    before_action :authenticate_admin!
  def index
    if params[:day]
      @orders = Order.created_today
    else
  	   @orders = Order.all
    end
  end

  def show
  	@order = Order.find(params[:id])
    @items = @order.ordered_items
  end

  def update
#orderのdeposit_statusの更新
  	@order = Order.find(params[:id])
    @order.update(order_params)
    flash[:success] = "更新に成功しました"
  	redirect_to admins_orders_path
  end

  private
  def order_params
  	params.require(:order).permit(:deposit_status,ordered_items_attributes:[:id, :product_status])
  end

end
end
