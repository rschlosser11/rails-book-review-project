class BooksController < ApplicationController
  def new
    if helpers.is_reviewer?
      @book = Book.new
      @author = @book.build_author
      @genre = @book.build_genre
    else
      redirect_to root_path, flash: {warning: "You must be a reviewer to add a book"}
    end
  end

  def create
    if helpers.is_reviewer?
      @book = Book.new(book_params)
      @author = @book.author || @book.build_author
      @genre = @book.genre || @book.build_genre
      if @book.save
        redirect_to new_book_review_path(@book)
      else
        render :new
      end
    else
      redirect_to root_path, flash: {warning: "You must be a reviewer to add a book"}
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    if helpers.is_reviewer?
      @book = Book.find(params[:id])
      @author = @book.author
      @genre = @book.genre
    else
      redirect_to book_path(params[:id]), flash: {warning: "You must be a reviewer to edit a book"}
    end
  end

  def update
    if helpers.is_reviewer?
      @book = Book.find(params[:id])
      @book.update(book_params)
      @book.save
      redirect_to book_path(@book)
    else
      redirect_to book_path(params[:id]), flash: {warning: "You must be a reviewer to edit a book"}
    end
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
