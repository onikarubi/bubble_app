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
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image)
  end
end
