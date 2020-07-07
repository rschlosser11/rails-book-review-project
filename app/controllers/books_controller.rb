class BooksController < ApplicationController
  def new
    @book = Book.new
    @author = @book.build_author
    @genre = @book.build_genre
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to new_book_review_path(@book)
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    @book.save
    redirect_to book_path(@book)
  end

  def index
    if params[:search].present?
      @books = Book.title_start_with(params[:search])
    else
      @books = Book.all
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :summary, :publish_year, :author_id, :genre_id, :cover, genre_attributes: [:name], author_attributes: [:name, :bio])
  end
end
