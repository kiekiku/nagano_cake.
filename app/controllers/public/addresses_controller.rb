class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
     redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:success] = "更新に成功しました"
      redirect_to addresses_path
    end
  end


  def destroy
    @address = Address.find(params[:id])
    @address.destroy
      redirect_to addresses_path
  end

  private
    def address_params
    params.require(:address).permit(:postal_code, :address, :name)
    end
end