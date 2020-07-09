class UsersController < ApplicationController
	before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user)
  		flash[:success] = "マイページを更新しました"
  	else
  		render :edit
  		flash[:danger] = "必要情報を入力してください"
  	end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:success] = "アカウントを削除しました"
    redirect_to root_path
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
