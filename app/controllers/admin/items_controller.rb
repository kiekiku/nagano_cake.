class Admin::ItemsController < ApplicationController
#ログインユーザーのみproduct#indexは閲覧可
  before_action :authenticate!, except: [:index]
#退会済みユーザー
  before_action :user_is_deleted, except: [:index]

  def new
    @item = Item.new
  end

  def edit
  end

#商品一覧ページ
	def index
        if params["genre"]
        	@items = Item.active.where(genre_id: params["genre"])
        else
			    @items = Item.active
        end
          @genres = Genre.active

	end

# 顧客側の商品詳細ページ
	def show
		@item = Item.find(params[:id])
		@cart_item = CartItem.new(item_id: @item.id)

	#管理者は買い物はできないが、詳細ページの閲覧はできる。
		if current_user.nil?
			items = CartItem.all
		else
			items = current_user.cart_items
		end

	#既にカートに商品が入っているときは、商品一覧ページに戻る
		if items.pluck(:product_id).include?(@cart_item.product_id)
			flash[:warning] = "その商品はカートに入っています"
			redirect_to root_path
		end
	end

end
	private

#ストロングパラメーター
	def product_params
		params.require(:product).permit(:image_id, :name, :introduction)
	end

#adminでなければuserの中で振り分ける
    def authenticate!
      if admin_signed_in?
      else
      	authenticate_user!
      end
    end

#退会済みユーザーへの対応
    def user_is_deleted
      if user_signed_in? && current_user.is_deleted?
         redirect_to root_path
      end
    end

