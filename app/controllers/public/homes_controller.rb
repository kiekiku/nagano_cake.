class Public::HomesController < ApplicationController
  def top
    @items = Item.order(created_at: :desc).limit(4)
    p @items

  end

  def about
  end
end
