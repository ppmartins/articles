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

    if @article.save
      flash[:notice] = "Your article was saved successfully."
      redirect_to article_path

    else
      flash[:alert] = "Your article wasn't saved. Please try again."
      render :new
    end
  end

  def edit
  end
end
