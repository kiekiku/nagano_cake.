class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    #@item.is_active = true
    if @item.save
      flash[:success] = "登録に成功しました"
      redirect_to admin_item_path(@item.id)
    else
      flash[:warning] = "入力内容を確認してください"
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "更新に成功しました"
      redirect_to admin_items_path
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :price, :introduction, :genre_id, :is_active, :image)
    end
end


