class FavoritesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @favorite = current_user.favorites.create(article_id: @article.id)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @favorite = current_user.favorites.find_by(article_id: @article.id)

    @favorite.destroy
  end
end
