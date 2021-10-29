class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :search_articles, only: %i[index show new edit]

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).includes(:user).order(updated_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.includes(:user)
    @comment = current_user.comments.new if user_signed_in?
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
