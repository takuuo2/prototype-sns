class BooksController < ApplicationController
  def new
    @book = Book.new
  end


  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      @user =  @book.user
      render:index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to user_path(book.user_id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end
