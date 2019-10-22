class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:edit, :update]}
  def top
  end

  def index
  	@users = User.all
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	 redirect_to user_path(@user.id), flash: {userup: "You have updated user successfully"}
    else
      @book = Book.new
      @users = User.all
      render :edit
    end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
