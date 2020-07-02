class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @book_id = params[:book_id] if params[:book_id]
    @books = Book.all
  end
end
