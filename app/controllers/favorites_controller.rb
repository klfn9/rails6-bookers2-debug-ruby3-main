class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_favorite = Favorite.new(user_id: current_user.id, book_id: params[:book_id])
  @book_favorite.save
  @favorite_count = Favorite.where(book_id: params[:book_id]).count
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    @book_favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
  @book_favorite.destroy
  @favorite_count = Favorite.where(book_id: params[:book_id]).count
  end
end
