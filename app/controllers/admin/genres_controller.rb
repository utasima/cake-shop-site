class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_genre, only: [:destroy, :update, :edit]

  def index
    @genre = Genre.new
    @genres = Genre.with_deleted
  end
  
  def edit
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path(@genres), notice: 'ジャンルを追加しました'
    else
      @genres = Genre.all
      render action: :index
    end
  end
  
  def update
    if 
      @genre.update(genre_params)
      redirect_to admin_genres_path(@genres), notice: '更新しました。'
    else
      @genres = Genre.all
      render action: :index
    end
  end

  def destroy
    @genre.destroy
    redirect_to admin_genres_path
  end

  def regeneration
    @genre = Genre.with_deleted.find(params[:id])
    @genre.restore
    redirect_to admin_genres_path
  end

  private
  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:deleted_at, :name, )
  end
end
