class Public::AddressesController < ApplicationController
  def index
    @address = current_customer.address
  end

  def edit
    @address = current_customer.address
  end
end
