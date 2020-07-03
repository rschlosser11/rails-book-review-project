class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @book_id = params[:book_id] if params[:book_id]
    @books = Book.all
  end

  def create
    @review = Review.new(review_params)
    @books = Book.all
    @book_id = params[:review][:book_id] if params[:review][:book_id]
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
    @book = @review.book
  end

  private

  def review_params
    params.require(:review).permit(:book_id, :title, :blurb, :content, :user_id, :rating)
  end
end
