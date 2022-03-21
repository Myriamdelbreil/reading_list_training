class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def create
    @new_review = Review.new(review_params)
    @new_review.article = Article.find(params[:article_id])
    @new_review.user = current_user
    if @new_review.save!
      redirect_to article_path(@new_review.article)
    else
      render :new
    end
  end


  private

  def review_params
    params.require(:review).permit(:title, :content, :user)
  end
end
