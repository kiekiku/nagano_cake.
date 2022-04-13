class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!

  def index
  	@customers = Customer.all
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       flash[:success] = "更新に成功しました"
       redirect_to admin_customer_path(@customer)
    else
       flash[:warning] = "入力内容を確認してください"
       render :edit
    end
  end

  def toggle
  	@custmer = Customer.find(params[:id])

  	if @customer.is_deleted?
  		  @customer.is_deleted = false
  	else
  		  @customer.is_deleted = true
  	end
        @customer.save
        redirect_to edit_admin_customer_path(@customer)
  end

  private
  	def customer_params
  		params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :phone, :email, :is_deleted)
  	end
end
  