class BooksController < ApplicationController
  def new
    @book = Book.new
    @author = @book.build_author
    @genre = @book.build_genre
  end

  def create
    raise.params
  end
end
