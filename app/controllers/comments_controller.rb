class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comments = @article.comments.includes(:user).order(created_at: :desc)
    @comment = current_user.comments.build(comment_params)
    @comment.user_id = current_user.id

    @comment.save
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])

    @comment.update(comment_params)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :image, :article_id)
  end
end
