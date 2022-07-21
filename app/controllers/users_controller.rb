class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_image = PostImage.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :address, :telephone_number, :email)
  end

  def post_image_params
    params.require(:post_image).permit(:image)
  end
end
