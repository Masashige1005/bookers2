class BooksController < ApplicationController

  before_action :authenticate_user!, only: [:index, :show, :edit]
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def top
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.new
    @detail = Book.find(params[:id])
    #投稿詳細ページでユーザー画像とユーザー名を表示させる
    @user = @detail.user
  end

  def new
  	@book = curret_user.books.build
  end

  def edit
    flash[:update] = 'You have updated book successfully'
    @book = Book.find(params[:id])
  end

  def create
    #投稿したユーザーのidを保存します。
    @book = current_user.books.build(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), flash: {notice: 'You have created book successfully'}
    else
      @books = Book.all
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), flash: {notice: 'You have updated book successfully'}
    else
      @books = Book.all
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      @book.destroy
    end
    redirect_to books_path
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
      redirect_to books_path
    end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
