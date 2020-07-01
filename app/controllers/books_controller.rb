class BooksController < ApplicationController
  def new
    @book = Book.new
    @author = @book.build_author
    @genre = @book.build_genre
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :summary, :publish_date, :author_id, :genre_id, genre_attributes: [:name], author_attributes: [:name, :bio])
  end
end
