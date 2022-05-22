class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.recommended
    p @items
  end

  def about
  end
end
