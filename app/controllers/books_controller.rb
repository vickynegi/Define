class BooksController < ApplicationController
  def index
    # @author = Author.all
    @books = Book.all
  end

  def new
    @author = Author.all

  end

  def create
    @author = Author.find_by(id: params['author_id'])
    book = Book.find_or_create_by(title: params['title'])
    unless @author.books.pluck(:id).include? book.id
      @author.books << book
    end
  end

  def delete
    @book = Book.find_by(id: params['id'])
    @book.authors.clear
    @book.delete
  end

  def edit
  end

  def update
    @book = Book.find_by(id: params['id'])
    
    response = {}
    if @book.update(title: params['title'])
      response = {status: 200, 'message' => 'Record has been Updated'}
    else
      response = {status: 400, 'message' => 'Record has not been Updated'}
    end
    render json: response
  end
end
