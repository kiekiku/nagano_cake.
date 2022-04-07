class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new
    if @genre.save
      flash[:success] = "登録に成功しました"
      redirect_to admin_genres_path
    else
      flash[:warning] = "入力内容を確認してください"
  		render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.name = params[:name][@genre.id.to_s]
    @genre.save
    flash[:success] = "更新に成功しました"
    redirect_to admins_genres_path
  end

  private
  	def genre_params
  		params.require(:genre).permit(:name,:is_disable,params[:name])
  	end
end