class Admin::HomesController < ApplicationController
    	before_action :authenticate_admin!
  def top
  	 @items = OrderedItem.created_today
  	 
  end
end
