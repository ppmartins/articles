class CommentsController < ApplicationController
  before_action :user_signed_in?
  before_action :authorize_user, only: [:destroy]

  def create
    @article = Article.find(params[:article_id])
    comment = @article.comments.new(comment_params)
    comment.user = current_user

    if comment.save
      flash[:notice] = "Comment saved successfully."
      redirect_to @article
    else
      flash[:alert] = "Comment failed to save. Please try again."
      redirect_to @article
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    comment = @article.comments.find(params[:id])

    if comment.destroy
      flash[:notice] = "Comment was deleted successfully."
      redirect_to @article
    else
      flash[:alert] = "Comment wasn't deleted. Please try again."
      redirec_to @article
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user
    @article = Article.find(params[:article_id])
    comment = Comment.find(params[:id])
    unless current_user == comment.user #|| current_user.admin?
      flash[:alert] = "You do not have permission to delete this comment."
      redirect_to @article
    end
  end
end
