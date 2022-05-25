class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    #byebug
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_image_path(@post_image)
  end

  def index
    @post_image = PostImage.page(params[:page]).reverse_order
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_image_comment = PostImageComment.new
    @user = @post_image.user
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:image, :name, :body, :address, :latitude, :longitude)
  end
end
