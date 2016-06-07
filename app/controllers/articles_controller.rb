class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @articles = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:article][:title]
    @article.body = params[:article][:body]
    @article.topic_id = params[:article][:topic_id]

    if @article.save
      flash[:notice] = "Your article was saved successfully."
      redirect_to @article

    else
      flash[:alert] = "Your article wasn't saved. Please try again."
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.title = params[:article][:title]
    @article.body = params[:article][:body]

    if @article.save
      flash[:notice] = "Your article was updated successfully."
      redirect_to @article

    else
      flash[:alert] = "Your article wasn't updated. Please try again."
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])

    if @article.destroy
      flash[:notice] = "Your article was deleted successfully."
      redirect_to articles_path

    else
      flash[:alert] = "Your article wasn't deleted. Please try again."
      render :show
    end
  end
end
