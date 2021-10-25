class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:user).order(updated_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])

    redirect_to root_path if @article.user != current_user.id
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image)
  end
end
