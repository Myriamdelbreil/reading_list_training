class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @new_review = Review.new
  end

  def new
    @new_article = Article.new
  end

  def create
    @new_article = Article.new(article_params)
    @new_article.user = current_user
    if @new_article.save!
      redirect_to article_path(@new_article)
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :content, :photo, :user)
  end
end
