class BooksController < ApplicationController

  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].blank?
      @books = Book.all.order("title ASC ")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @books = Book.where(:category_id => @category_id).order("title ASC")
    end 
  end

  def new
    @book = current_user.books.build
    @categories = Category.all.map do |c|
      [c.name, c.id]
    end
  end

  def create
    @book = current_user.books.build(book_params)
    @book.category_id = params[:category_id]

    if @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    @categories = Category.all.map do |c|
      [c.name, c.id]
    end
  end

  def update
    @book.category_id = params[:category_id]
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private

    def book_params
      params.require(:book).permit(:title, :author, :description, :category_id)
    end

    def find_book
      @book = Book.find(params[:id])
    end
end
