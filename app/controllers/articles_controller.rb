class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order('updated_at desc')
  end

  def show

  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
  end

  def edit
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image)
  end
end
