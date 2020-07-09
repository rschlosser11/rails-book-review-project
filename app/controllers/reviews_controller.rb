class ReviewsController < ApplicationController
  def new
    if helpers.is_reviewer?
      @review = Review.new
      @book_id = params[:book_id] if params[:book_id]
      @books = Book.all
    else
      redirect_to root_path, flash: {warning: "You must be a reviewer to write a review"}
    end
  end

  def create
    if helpers.is_reviewer?
      @review = Review.new(review_params)
      @books = Book.all
      @book_id = params[:review][:book_id] if params[:review][:book_id]
      if @review.save
        redirect_to review_path(@review)
      else
        render :new
      end
    else
      redirect_to root_path, flash: {warning: "You must be a reviewer to write a review"}
    end
  end

  def show
    @review = Review.find(params[:id])
    @book = @review.book
    @comment = @review.comments.build
  end

  def index
    @reviews = Review.all
  end

  def edit
    @review = Review.find(params[:id])
    if helpers.can_edit_review(@review)
      @books = Book.all
      @book_id = @review.book.id
    else
      redirect_to review_path(params[:id]), flash: {warning: "You must be a writer of the review to edit it"}
    end
  end

  def update
    @review = Review.find(params[:id])
    if helpers.can_edit_review(@review)
      @review.update(review_params)
      redirect_to review_path(@review)
    else
      redirect_to review_path(params[:id]), flash: {warning: "You must be a writer of the review to edit it"}
    end
  end

  private

  def review_params
    params.require(:review).permit(:book_id, :title, :blurb, :content, :user_id, :rating)
  end
end
