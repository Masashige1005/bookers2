class UsersController < ApplicationController
  #ログインしてないユーザーがプロフィールイメージに飛んでもガードします。
  before_action :authenticate_user!
  #ユーザーのみが編集権限を持つように変更するよ！
  before_action :ensure_correct_user, {only: [:edit, :update]}

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

  #ここでユーザーのみが編集できるようにチェックするよ！
  def ensure_correct_user
    @user = User.find(params[:id])
    #ユーザーIDのチェックするよ！
    unless @user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

  private
  def user_params
    #ここにname,introductionが定義されていないとViewで反映されないので注意だよ！
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
